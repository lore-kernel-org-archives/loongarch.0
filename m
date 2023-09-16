Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A1B134C4
	for <loongarch@lists.linux.dev>; Sat, 16 Sep 2023 12:06:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EBCAC433CA
	for <loongarch@lists.linux.dev>; Sat, 16 Sep 2023 12:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694865966;
	bh=pym0uMbgIIU9FmgXRD1TcUJqDfsFiCpt/LN+3YIJd8Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=r4E+xR82uxlkGBbGxYlasgHFa1KHXtG0ywFryFi3oS12gyF7+kRNf1Qf/1rv8rR7A
	 8xGslYSj79NVk+JzAWnjSIpmvFQs5hRaahwEMuxorqVCCS29q2J4EiQscaOrrO/wF3
	 ROaqDdJX0yivHiaU0Cjz86MuKCY5/ey/k0zG70ZRFQ6CbDvbO3OJEF/9MpGn4LQWzP
	 K+X4u/b0NnbtgBgpAr2goiag+XAcAQwIzNdJZL+chFcMaqXNvzSxkA5G1DTysbWj2g
	 Vhp9fn4i0OAnw2avs2iOQT/KV1oTGIcgtlWRyy/+F1K0jpROdtOQymahvop4/7sDUj
	 +prhG9Lun/1lA==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-503056c8195so494189e87.1
        for <loongarch@lists.linux.dev>; Sat, 16 Sep 2023 05:06:06 -0700 (PDT)
X-Gm-Message-State: AOJu0YylPU7wx6vsRncHCxLNubI8WYb7y1WWQBAYktzlRbniSeltQphi
	SbjSowb9pxino30N+lGH2F+3NaxVgb7BukDGeUA=
X-Google-Smtp-Source: AGHT+IE2eeeJ1Keo+h3txEbl7/sMqm9XFoJy7MP77Kn6JL7m1U3peD8m4tOXk6YZGShW4GuX+BqJXucLOZmfgj93XtE=
X-Received: by 2002:a19:6d16:0:b0:500:b14a:cc63 with SMTP id
 i22-20020a196d16000000b00500b14acc63mr3011464lfc.12.1694865964636; Sat, 16
 Sep 2023 05:06:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230914103445.511285-1-andriy.shevchenko@linux.intel.com>
 <CAAhV-H6Q0sirFEDdc1v4BSfDY94eZvJazy0XLKM8V94GMJvQnQ@mail.gmail.com>
 <ZQNWh2DY319jGbfq@smile.fi.intel.com> <CAAhV-H66LUWHP-eGp6VGvs0F+QD=QJ69uR3_1A3SqH9cyPUPoQ@mail.gmail.com>
 <ZQWCeI6E7rm8Akbt@smile.fi.intel.com>
In-Reply-To: <ZQWCeI6E7rm8Akbt@smile.fi.intel.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 16 Sep 2023 20:05:52 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6dakVH0a4Mt9MdcY8OO3gdne6rW0Z1kK6YRq9hDLP05w@mail.gmail.com>
Message-ID: <CAAhV-H6dakVH0a4Mt9MdcY8OO3gdne6rW0Z1kK6YRq9hDLP05w@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] LoongArch: Add missing headers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	WANG Xuerui <kernel@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Sep 16, 2023 at 6:27=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Sep 15, 2023 at 08:36:24AM +0800, Huacai Chen wrote:
> > On Fri, Sep 15, 2023 at 2:53=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Thu, Sep 14, 2023 at 11:25:22PM +0800, Huacai Chen wrote:
>
> > > > Thank you for your patch, can this patch solve the problem below?
> > > > https://lore.kernel.org/oe-kbuild-all/202309072237.9zxMv4MZ-lkp@int=
el.com/T/#u
> > >
> > > Nope, this just adds missing includes.
> > > No functional change, so warnings will still be there.
> > But I think a patch should solve a problem.
>
> No, that problem is static analyser concern, not the compiler nor linker.
>
> > If we don't get a build
> > error or warning without this patch, does that mean the 'missing'
> > headers are actually included indirectly?
>
> I might be missing something, but I do not see any build error in the abo=
ve message.
Hmm, then I think I will take the second patch only.

Huacai
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>
