Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD5C10E6
	for <loongarch@lists.linux.dev>; Wed, 21 Jun 2023 04:54:17 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-763a3032893so240705785a.2
        for <loongarch@lists.linux.dev>; Tue, 20 Jun 2023 21:54:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687323256; x=1689915256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y1TnxLY/k2SYoAsqYAm+lbkNiBoCiFdnAyxoiLnGFx0=;
        b=eB5E2+fiqLkYHaKG8lWidK6qvBBJyUS9cB0suRvPGdzEfvUeFMc/87iCqZETcx+2Zm
         t5AxM9DNcF8ri3s4cU8QRLplLumAiDIPbkXrSPaoZ8sfeNDwry/x369MPo2/rIf/rEiN
         tuofwIYIuWczX+gj7g9HHRCjlCdA2kA/st4biIvjQEOG8I8yJA1LaH/VVNGfai6c5afK
         5dwP82atgw1BAy//h0jdB+jOKVZjGJ+diSE6G8tJ43hq8DPOky9lMb+fm9o7gLfbH5WQ
         5pQRJUtZQOCZW5xDGC3xU+ad5Y5A2Jqvt4Yqeg2bBzMYMdT27lUR1blNzjrboHz6azQ6
         dZOA==
X-Gm-Message-State: AC+VfDyFgFFgp5rK+4zovLVMLJWw2gCw7jHx66JlA4NcQCX4RbjZNs52
	h7MCn6XQkml7XNEu7HRfCpBAYaKuxf5YN2iLiwQ=
X-Google-Smtp-Source: ACHHUZ5DhIUGLzwFq+zSDS5e7IzVZs5JDEr2gT/RxErAcTo+wJW+RCeZiQiMgo659bOC3zkMI8kMSXuM+411RiSz6PY=
X-Received: by 2002:a05:620a:450d:b0:762:3d10:dc5f with SMTP id
 t13-20020a05620a450d00b007623d10dc5fmr17058907qkp.58.1687323256155; Tue, 20
 Jun 2023 21:54:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230620132025.105563-1-wangrui@loongson.cn> <CAM9d7chjhFNjDMADJTTz5TNgCCuyPzy8VCDvZxw5K5girfWu1A@mail.gmail.com>
 <CAHirt9hDc-22AKrRZEEUW9LUa3hjmnEVrYDNyWCx4kkWU4WzXA@mail.gmail.com>
In-Reply-To: <CAHirt9hDc-22AKrRZEEUW9LUa3hjmnEVrYDNyWCx4kkWU4WzXA@mail.gmail.com>
From: Namhyung Kim <namhyung@kernel.org>
Date: Tue, 20 Jun 2023 21:54:04 -0700
Message-ID: <CAM9d7cgkV3CZ_2xAp+v62hpfutAB+RpsnvGa2u09P4C0Fm5ULw@mail.gmail.com>
Subject: Re: [PATCH] perf annotate: Fix instruction association and parsing
 for LoongArch
To: WANG Rui <wangrui@loongson.cn>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 20, 2023 at 9:37=E2=80=AFPM WANG Rui <wangrui@loongson.cn> wrot=
e:
>
> Hello Namhyung,
>
> On Wed, Jun 21, 2023 at 2:42=E2=80=AFAM Namhyung Kim <namhyung@kernel.org=
> wrote:
> > > +static int loongarch_call__parse(struct arch *arch, struct ins_opera=
nds *ops, struct map_symbol *ms)
> > > +{
> > > +       char *c, *endptr, *tok, *name;
> > > +       struct map *map =3D ms->map;
> > > +       struct addr_map_symbol target =3D {
> > > +               .ms =3D { .map =3D map, },
> >
> > Looking here...
> >
> > > +       };
> > > +
> > > +       c =3D strchr(ops->raw, '#');
> > > +       if (c++ =3D=3D NULL)
> > > +               return -1;
> > > +
> > > +       ops->target.addr =3D strtoull(c, &endptr, 16);
> > > +
> > > +       name =3D strchr(endptr, '<');
> > > +       name++;
> > > +
> > > +       if (arch->objdump.skip_functions_char &&
> > > +           strchr(name, arch->objdump.skip_functions_char))
> > > +               return -1;
> > > +
> > > +       tok =3D strchr(name, '>');
> > > +       if (tok =3D=3D NULL)
> > > +               return -1;
> > > +
> > > +       *tok =3D '\0';
> > > +       ops->target.name =3D strdup(name);
> > > +       *tok =3D '>';
> > > +
> > > +       if (ops->target.name =3D=3D NULL)
> > > +               return -1;
> > > +
> > > +       target.addr =3D map__objdump_2mem(map, ops->target.addr);
> > > +
> > > +       if (maps__find_ams(ms->maps, &target) =3D=3D 0 &&
> > > +           map__rip_2objdump(target.ms.map, map__map_ip(target.ms.ma=
p, target.addr)) =3D=3D ops->target.addr)
> >
> > So the target.ms.map is 'map', right?  Then we can reduce the line.
>
> toos/perf/util/maps.c:
>
> > int maps__find_ams(struct maps *maps, struct addr_map_symbol *ams)
> > {
> >     if (ams->addr < map__start(ams->ms.map) || ams->addr >=3D map__end(=
ams->ms.map)) {
> >         if (maps =3D=3D NULL)
> >             return -1;
> >         ams->ms.map =3D maps__find(maps, ams->addr);
>
> Is it possible that `target.ms.map` might be reassigned within the
> `maps_find_ams` function in this case?

Ah, ok.  Missed that part.  It can change if the target is from a
different library.

Acked-by: Namhyung Kim <namhyung@kernel.org>

Thanks,
Namhyung

>
> >         if (ams->ms.map =3D=3D NULL)
> >             return -1;
> >     }
> >
> >     ams->al_addr =3D map__map_ip(ams->ms.map, ams->addr);
> >     ams->ms.sym =3D map__find_symbol(ams->ms.map, ams->al_addr);
> >
> >     return ams->ms.sym ? 0 : -1;
> > }

>
