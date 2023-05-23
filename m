Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A6F1D2BF
	for <loongarch@lists.linux.dev>; Tue, 23 May 2023 07:30:16 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-64d57cd373fso1855229b3a.1
        for <loongarch@lists.linux.dev>; Tue, 23 May 2023 00:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684827016; x=1687419016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3cJLYszLPTbCF5D2lChgFyIZOVgyra6zrz+cbXkHEpc=;
        b=xEvXmtOow7DKZ+dwBkiy/5V06J1nysCIso80vhRqy/mmHQPFpNIcmDziOwHemM7S0j
         /5t+henqgz9ahhtsa3XTOCzFiZJ1U+Qc8DtCYJOR2mHZq36XVcMFup2S092fgQqWE8ZE
         w4l2p0YfVxWxL+CZKqoQs2icH16xFjNa/oDOWD+IhsyTXizhTqUz0UkJb/nCKyBbx0/m
         WL943oJrxJXMYbd8nlJvEzVWAkwMZDy/BhnnThPo8MQv3FQ0LqHnDCeEngBGo1V1eKxn
         YcAxkKLeUS0wDa7UeJJRyILRELHxgUE3CuDTYWymUN1y/smLULZtzXDCviz9K62Tj3X6
         I7Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684827016; x=1687419016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3cJLYszLPTbCF5D2lChgFyIZOVgyra6zrz+cbXkHEpc=;
        b=Ph3B+DvzqYAnEVqXDNrLLB2WyE+y11twXcVrgxaZG1cg43ilxc1ebWmZFRU1KIM29W
         tiI4MpR2vqAKsQeuJsHy6NojwcK/IdvY7m/f7LGIxq89xIktOzhvEwG528OOQ5tcyEUP
         0UZL/rFdTgSi+1dqc20ER7iML/8dLS7TlgrYS41ri2hPrBx54aMTwK6PczpojenhGE7G
         2g1Op9UVRmvmgctxnvqEpZQogC7fqwXDkp7IxR7M1we9F7TWwKDIibYM9JIeb6GzsMxA
         a2SzSEEXxdWKrxObK0yCnIOTmTjwmy5PIRsGWH0dD0XXVaPW3IlE6gDcx8i3/w/+/lGM
         Hx4Q==
X-Gm-Message-State: AC+VfDw8xKeXmiN8mSFrVZ8+gQ+bp3LlNefvqYYuyUEVaOrU68Ik9ZlP
	z2s2VOib105ODKnDn8yeY/rjSg==
X-Google-Smtp-Source: ACHHUZ5bxVDkQxvniUkQDm1ZjQoQT/khNRoinaGjLQvly0lsCRM1/dvISXoxrNCPzWnx1TjNkNWGRA==
X-Received: by 2002:a05:6a20:4420:b0:10b:aeff:aa00 with SMTP id ce32-20020a056a20442000b0010baeffaa00mr5592857pzb.28.1684827016299;
        Tue, 23 May 2023 00:30:16 -0700 (PDT)
Received: from leoy-yangtze.lan ([107.151.177.126])
        by smtp.gmail.com with ESMTPSA id 31-20020a63185f000000b00513973a7014sm2486505pgy.12.2023.05.23.00.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 00:30:15 -0700 (PDT)
Date: Tue, 23 May 2023 15:30:07 +0800
From: Leo Yan <leo.yan@linaro.org>
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	linux-perf-users@vger.kernel.org, loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org, loongson-kernel@lists.loongnix.cn
Subject: Re: [PATCH] perf symbol: Add LoongArch case in get_plt_sizes()
Message-ID: <20230523073007.GB1969788@leoy-yangtze.lan>
References: <CAAhV-H7waE0gmSU09YKJMHDAnj7BV7ukiLqWs+JzzLrHDG5z8w@mail.gmail.com>
 <20230518030618.GB1068119@leoy-yangtze.lan>
 <CAAhV-H6L9kNyGU2UrX7jyN_6O_pafSVSamP7DYHkzfMgmCxVXA@mail.gmail.com>
 <20230518032129.GC1068119@leoy-yangtze.lan>
 <CAAhV-H6_=qwheWvNozop2+9MexnOZQcva28xaeikCc49_DqABA@mail.gmail.com>
 <20230518040553.GE1068119@leoy-yangtze.lan>
 <ZGYXKnRZQh18D2Fd@kernel.org>
 <CAAhV-H40kQf5WD-8ozFwS6copfQaGtUJqm=nvQ6btXZnpDmZFA@mail.gmail.com>
 <387463f9-adb0-8e98-1de6-cae7a79a7d03@loongson.cn>
 <CAAhV-H4mLCZ7qN3y6siTzpaybMr64f4FrKhfUhA_Qjm-O+sKnQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAhV-H4mLCZ7qN3y6siTzpaybMr64f4FrKhfUhA_Qjm-O+sKnQ@mail.gmail.com>

On Tue, May 23, 2023 at 09:47:19AM +0800, Huacai Chen wrote:

[...]

> > > I'm very sorry that this patch breaks cross-build. We need some
> > > additional modification.
> > >
> > > diff --git a/tools/perf/util/symbol-elf.c b/tools/perf/util/symbol-elf.c
> > > index 5d409c26a22e..b3dbf6ca99a7 100644
> > > --- a/tools/perf/util/symbol-elf.c
> > > +++ b/tools/perf/util/symbol-elf.c
> > > @@ -35,6 +35,10 @@
> > >  #define EM_AARCH64     183  /* ARM 64 bit */
> > >  #endif
> > >
> > > +#ifndef EM_LOONGARCH
> > > +#define EM_LOONGARCH   258
> > > +#endif
> > > +

I confirmed that we must apply this change, otherwise, it will
introduce perf building failure on Ubuntu 22.04 (jammy) with my Arm64
machine.

Sorry I didn't detect the building failure when reviewed this patch!

Thanks,
Leo
