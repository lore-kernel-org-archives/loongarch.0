Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926DC19B
	for <loongarch@lists.linux.dev>; Thu, 18 May 2023 03:06:25 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-64384c6797eso1203708b3a.2
        for <loongarch@lists.linux.dev>; Wed, 17 May 2023 20:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684379185; x=1686971185;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VZxAJuNZvZOf2PM7ERBaGRuoePGDwpy1853Ks1BOCkU=;
        b=yv18ToFNadIMZPkCAcQNXKT3LVJToMnN8eYjMeDshshik9b1qp8LAWkYfjgGVarkpH
         ls8p8a32/PMQiKVfGlGdOVKYA14iMwDZfXaKQlIEitTEJxmEO1gZ2s0FaXsFGNPl5+Gp
         aK86Dksn5HBA7xGDBve9pLs4Ond4FjQD7nE22hbonQUCGKmkkwEgDfGdGO5GTIBKDh+x
         TJy0TabycrYEngK5t74IHwB3yc1Yc/kj9yHmOCIvmGX9FGBQlyvjIS3Y4rutYpknLEI5
         uR7v/rewYRNjI8lKStK1jHa6T3GFOn/rN2kei/WM0kjobyMhu8vseSSUq3LgtuJq6QzI
         6yWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684379185; x=1686971185;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VZxAJuNZvZOf2PM7ERBaGRuoePGDwpy1853Ks1BOCkU=;
        b=dbVZWzwpXf1BSO/kxq6ZwHhk9kM2uKoKa0P5qhO/l/vKOWnva/+p2YkOudb+C9HQjf
         cgdZWiX4LS5XEovLDWRy20wG8y+VtCuGJs2RPefUwwdv1RQGt/li0wOS0NBUn67R2GPH
         vNaqwt/U/MeqNia4vtahejKcOMAeqhgSlnFMNV+PXh0ys76DYLtTe/xpul7DMNbou5oo
         vsUxQHgtKCZp1iqaKDzQNA0YCjpjUXWwKExKxS2ynDCmVmg+fkE1YJfrR2nkU7A19jhs
         po811KBkYccntejdyZGpmmbIfdFVdLQ9H+0P3o4qiQxSvvrUhMQtyJhddE2TxSuE7GlE
         5Y1g==
X-Gm-Message-State: AC+VfDxTuHhIBxWULBsRMz/I592udB8RdOsPx2rCrY6YFxA1ECy3L6qm
	WAL0HWNbUGv/o/1db0ON19Ytow==
X-Google-Smtp-Source: ACHHUZ6wMSlwT0O68UsYIGLKK0p+uaz1sgfDV2HUip2ijz7q4tkF+kLEJyN1uLQPGTt0gyHw4SxPOg==
X-Received: by 2002:a05:6a00:15cd:b0:646:5f98:6bb4 with SMTP id o13-20020a056a0015cd00b006465f986bb4mr2583507pfu.33.1684379184601;
        Wed, 17 May 2023 20:06:24 -0700 (PDT)
Received: from leoy-yangtze.lan ([156.59.236.115])
        by smtp.gmail.com with ESMTPSA id j13-20020aa78dcd000000b0064afdc88465sm208448pfr.213.2023.05.17.20.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 20:06:24 -0700 (PDT)
Date: Thu, 18 May 2023 11:06:18 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	linux-perf-users@vger.kernel.org, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH] perf symbol: Add LoongArch case in get_plt_sizes()
Message-ID: <20230518030618.GB1068119@leoy-yangtze.lan>
References: <1683615352-10794-1-git-send-email-yangtiezhu@loongson.cn>
 <CAAhV-H7waE0gmSU09YKJMHDAnj7BV7ukiLqWs+JzzLrHDG5z8w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAhV-H7waE0gmSU09YKJMHDAnj7BV7ukiLqWs+JzzLrHDG5z8w@mail.gmail.com>

On Thu, May 18, 2023 at 10:11:27AM +0800, Huacai Chen wrote:
> Queued, thanks.

The patch is fine for me.

Should not perf patches are to be merged via Arnaldo's tree?

Thanks,
Leo

> On Tue, May 9, 2023 at 2:56 PM Tiezhu Yang <yangtiezhu@loongson.cn> wrote:
> >
> > We can see the following definitions in bfd/elfnn-loongarch.c:
> >
> >   #define PLT_HEADER_INSNS 8
> >   #define PLT_HEADER_SIZE (PLT_HEADER_INSNS * 4)
> >
> >   #define PLT_ENTRY_INSNS 4
> >   #define PLT_ENTRY_SIZE (PLT_ENTRY_INSNS * 4)
> >
> > so plt header size is 32 and plt entry size is 16 on LoongArch,
> > let us add LoongArch case in get_plt_sizes().
> >
> > Link: https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=bfd/elfnn-loongarch.c
> > Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
> > ---
> >
> > This is based on 6.4-rc1
> >
> >  tools/perf/util/symbol-elf.c | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/tools/perf/util/symbol-elf.c b/tools/perf/util/symbol-elf.c
> > index b2ed9cc..5d409c2 100644
> > --- a/tools/perf/util/symbol-elf.c
> > +++ b/tools/perf/util/symbol-elf.c
> > @@ -411,6 +411,10 @@ static bool get_plt_sizes(struct dso *dso, GElf_Ehdr *ehdr, GElf_Shdr *shdr_plt,
> >                 *plt_header_size = 32;
> >                 *plt_entry_size = 16;
> >                 return true;
> > +       case EM_LOONGARCH:
> > +               *plt_header_size = 32;
> > +               *plt_entry_size = 16;
> > +               return true;
> >         case EM_SPARC:
> >                 *plt_header_size = 48;
> >                 *plt_entry_size = 12;
> > --
> > 2.1.0
> >
> >
