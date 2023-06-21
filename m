Received: from mail.loongson.cn (mail.loongson.cn [114.242.206.163])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC69C180
	for <loongarch@lists.linux.dev>; Wed, 21 Jun 2023 04:34:10 +0000 (UTC)
Received: from loongson.cn (unknown [209.85.208.50])
	by gateway (Coremail) with SMTP id _____8AxxvC1fZJkFQAAAA--.5S3;
	Wed, 21 Jun 2023 12:33:58 +0800 (CST)
Received: from mail-ed1-f50.google.com (unknown [209.85.208.50])
	by localhost.localdomain (Coremail) with SMTP id AQAAf8DxDc_8eZJkJAEAAA--.32S3;
	Wed, 21 Jun 2023 12:18:06 +0800 (CST)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-51a2c8e5a2cso7421659a12.2
        for <loongarch@lists.linux.dev>; Tue, 20 Jun 2023 21:18:05 -0700 (PDT)
X-Gm-Message-State: AC+VfDym9yDsp23eeShLFGeCqpYbeMTlDLJEgSCqnVHBuLEf7O9WVW+K
	VtOJRx46i+ELsXcLrDJbOCJHlBXWG4F6rbXMygIZqw==
X-Google-Smtp-Source: ACHHUZ4NbyRZWvmfN8G6zN4spULubzWBpkQQU1JsvmeAsqFQhaJ3lcgXL/QS2HBeY7kvekKVIU/OcmeCEJbFA6zurcA=
X-Received: by 2002:adf:f08b:0:b0:311:1ce2:ee1b with SMTP id
 n11-20020adff08b000000b003111ce2ee1bmr10295436wro.66.1687320634966; Tue, 20
 Jun 2023 21:10:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230620132025.105563-1-wangrui@loongson.cn> <CAM9d7chjhFNjDMADJTTz5TNgCCuyPzy8VCDvZxw5K5girfWu1A@mail.gmail.com>
In-Reply-To: <CAM9d7chjhFNjDMADJTTz5TNgCCuyPzy8VCDvZxw5K5girfWu1A@mail.gmail.com>
From: WANG Rui <wangrui@loongson.cn>
Date: Wed, 21 Jun 2023 12:10:24 +0800
X-Gmail-Original-Message-ID: <CAHirt9hDc-22AKrRZEEUW9LUa3hjmnEVrYDNyWCx4kkWU4WzXA@mail.gmail.com>
Message-ID: <CAHirt9hDc-22AKrRZEEUW9LUa3hjmnEVrYDNyWCx4kkWU4WzXA@mail.gmail.com>
Subject: Re: [PATCH] perf annotate: Fix instruction association and parsing
 for LoongArch
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Huacai Chen <chenhuacai@loongson.cn>, loongarch@lists.linux.dev, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, WANG Xuerui <kernel@xen0n.name>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CM-TRANSID:AQAAf8DxDc_8eZJkJAEAAA--.32S3
X-CM-SenderInfo: pzdqw2txl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBj93XoW7WryxAw4rXr4fAr4DWrWDWrX_yoW8Cr1Dpa
	4Iy3WxWr4xtry8CwsrJay8Z3ZxCw13WrW3A3s7tas8CFn8uF4fGa45KFyaka45Ar17Wr40
	vF4DZryFkrnrtFgCm3ZEXasCq-sJn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXa
	sCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU
	0xBIdaVrnRJUUUyGb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2
	IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48v
	e4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_
	Jr0_Gr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE44I27wAqx4
	xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v2
	6r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04k20xvY0x0EwIxGrw
	CFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE
	14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2
	IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxK
	x2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI
	0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IU1CPfJUUUUU==

Hello Namhyung,

On Wed, Jun 21, 2023 at 2:42=E2=80=AFAM Namhyung Kim <namhyung@kernel.org> =
wrote:
> > +static int loongarch_call__parse(struct arch *arch, struct ins_operand=
s *ops, struct map_symbol *ms)
> > +{
> > +       char *c, *endptr, *tok, *name;
> > +       struct map *map =3D ms->map;
> > +       struct addr_map_symbol target =3D {
> > +               .ms =3D { .map =3D map, },
>
> Looking here...
>
> > +       };
> > +
> > +       c =3D strchr(ops->raw, '#');
> > +       if (c++ =3D=3D NULL)
> > +               return -1;
> > +
> > +       ops->target.addr =3D strtoull(c, &endptr, 16);
> > +
> > +       name =3D strchr(endptr, '<');
> > +       name++;
> > +
> > +       if (arch->objdump.skip_functions_char &&
> > +           strchr(name, arch->objdump.skip_functions_char))
> > +               return -1;
> > +
> > +       tok =3D strchr(name, '>');
> > +       if (tok =3D=3D NULL)
> > +               return -1;
> > +
> > +       *tok =3D '\0';
> > +       ops->target.name =3D strdup(name);
> > +       *tok =3D '>';
> > +
> > +       if (ops->target.name =3D=3D NULL)
> > +               return -1;
> > +
> > +       target.addr =3D map__objdump_2mem(map, ops->target.addr);
> > +
> > +       if (maps__find_ams(ms->maps, &target) =3D=3D 0 &&
> > +           map__rip_2objdump(target.ms.map, map__map_ip(target.ms.map,=
 target.addr)) =3D=3D ops->target.addr)
>
> So the target.ms.map is 'map', right?  Then we can reduce the line.

toos/perf/util/maps.c:

> int maps__find_ams(struct maps *maps, struct addr_map_symbol *ams)
> {
>     if (ams->addr < map__start(ams->ms.map) || ams->addr >=3D map__end(am=
s->ms.map)) {
>         if (maps =3D=3D NULL)
>             return -1;
>         ams->ms.map =3D maps__find(maps, ams->addr);

Is it possible that `target.ms.map` might be reassigned within the
`maps_find_ams` function in this case?

>         if (ams->ms.map =3D=3D NULL)
>             return -1;
>     }
>
>     ams->al_addr =3D map__map_ip(ams->ms.map, ams->addr);
>     ams->ms.sym =3D map__find_symbol(ams->ms.map, ams->al_addr);
>
>     return ams->ms.sym ? 0 : -1;
> }

Thanks!

--=20
WANG Rui
Loongson Technology Corporation Limited

