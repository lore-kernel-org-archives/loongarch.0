Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDEB12B17A;
	Tue,  4 Jun 2024 09:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717494291; cv=none; b=kJIpNHjV7vB0WGGZfTugw+q2XDZoQAw8rYL72foyQn/hjVOIqsZPNu3kKqowMmgSrvao+1aNx6gQma34kvLrUehB4Hu5dY9nP++pWx+6x9PIAdVSQjxFE/SS1nZnqvfk8Zp1xtggMXP7e901v27BfOT31sCzH6bvrYpYr8nGEiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717494291; c=relaxed/simple;
	bh=+4OmtJ3U6XFFuxF3jlPU+uwvQfJQ0socmXs/VYgoIWM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MhNfxbXMgRDrSyRsQrzIo3xZRMFESe7iO41nZfewA7K08FMxqryrR1DLVg9gF1eALTveY06PmyBwV+z1p9IkY2T2Tf77GqbwroOwdRbLU3uF2QiE96dsQ34uk5UXD1WGESzUKkA6N7lRPWZ9ULlyAZHBQDoKnZTvsavjGIOfJcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rF/x5dc+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rF/x5dc+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C9CCC4AF08;
	Tue,  4 Jun 2024 09:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717494290;
	bh=+4OmtJ3U6XFFuxF3jlPU+uwvQfJQ0socmXs/VYgoIWM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=rF/x5dc+C88HaDirU07m1hy1gH5WkL+PZiAqqPLSfSz1DcOS7OP9AunMjbUp1zJKY
	 Hp8/fAW5iLMEYSc7T43ClWqBr4iXQ2/aYTmm3weJBoHAXHw0nJD8Co0+ihq7YPoObV
	 KOQ0mJtQMsONZ7QiYJ46upJfdiZM0Hfm2wULDfZO8t8fZ6qdvNid/nwDj6jp5wa0jR
	 d15fuABegmcn9+LDB4UoqjrFi07UjL/5tk6Z4CJhUoTDHhDn3fTwPljd1HeZsxK7vy
	 TfycRFly5i8L96XniDrW4BuVhUt7jfNNzyjXCa3rgs+Udzj28vhK8rE1g08IMsdVDT
	 W6pWR+MwKmoyw==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a68ca4d6545so456744666b.0;
        Tue, 04 Jun 2024 02:44:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVdS5VRU8JBYVcwjsU0FnM6RthSNY8DL8KGvGeJKsC72vvQSFRSky9LsIBK4YIm/GPz9veay7kRkSpBXG0OadW61RWm2xJt++o96uUtwd3Uu74OuCXnTaKPmqHVa8y7dLNIs+04dsF2Jg==
X-Gm-Message-State: AOJu0YyE1/8UJCbBJQES+xhNKgqB9skAQULS0ftZcwhh5KJ7XwFLEUcj
	FiKQQEr4/94OxG5SACPFucwza2LFLX08dGRzr2K9VaVrbXB7eQV4ZR24Jlrk61F/MzTaXyzcKRz
	IiFbtICmQG3V8SmN6/sL6gyQIk/8=
X-Google-Smtp-Source: AGHT+IHbocEQwR4Hr5RlJYKbDPGDBsDvn/4EQ7iPApoyeQTNpSe1BqB8yI7P5cbmGqh8BFExJbsrxv9bn4bF7Nj0Ho4=
X-Received: by 2002:a17:906:3893:b0:a68:c0b8:cfad with SMTP id
 a640c23a62f3a-a695456496emr139364166b.35.1717494289217; Tue, 04 Jun 2024
 02:44:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202405300545.mVqyyvyr-lkp@intel.com> <87ttiamkf4.fsf@jogness.linutronix.de>
 <Zl5m1ZlVmGKitAof@yujie-X299>
In-Reply-To: <Zl5m1ZlVmGKitAof@yujie-X299>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 4 Jun 2024 17:44:38 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5uxxxZA6VALSrBPEeq=ro3aou=B2+PE9wEiyxVa+L2VQ@mail.gmail.com>
Message-ID: <CAAhV-H5uxxxZA6VALSrBPEeq=ro3aou=B2+PE9wEiyxVa+L2VQ@mail.gmail.com>
Subject: Re: [rt-devel:linux-6.10.y-rt-rebase 63/93] kernel/printk/printk.o:
 warning: objtool: __jump_table+0x0: special: can't find orig instruction
To: Yujie Liu <yujie.liu@intel.com>
Cc: WANG Xuerui <kernel@xen0n.name>, John Ogness <john.ogness@linutronix.de>, 
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 4, 2024 at 9:07=E2=80=AFAM Yujie Liu <yujie.liu@intel.com> wrot=
e:
>
> + Loongarch folks
>
> Hi Huacai and Xuerui,
>
> Could you please help take a look at this case? Thanks.
We are attempting to solve this problem, please wait some time.

Huacai

>
> On Mon, Jun 03, 2024 at 11:48:55AM +0206, John Ogness wrote:
> > On 2024-05-30, kernel test robot <lkp@intel.com> wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-d=
evel.git linux-6.10.y-rt-rebase
> > > head:   6d20efa57a896036453f4b061ae22601ef61b494
> > > commit: 127f3e5b794bd6fa90d4649318dd898455efa6d7 [63/93] printk: Prov=
ide threadprintk boot argument
> > > config: loongarch-defconfig (https://download.01.org/0day-ci/archive/=
20240530/202405300545.mVqyyvyr-lkp@intel.com/config)
> > > compiler: loongarch64-linux-gcc (GCC) 13.2.0
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20240530/202405300545.mVqyyvyr-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202405300545.mVqyyvyr=
-lkp@intel.com/
> > >
> > > All warnings (new ones prefixed by >>):
> > >
> > >>> kernel/printk/printk.o: warning: objtool: __jump_table+0x0: special=
: can't find orig instruction
> > > --
> > >>> kernel/printk/nbcon.o: warning: objtool: __jump_table+0x0: special:=
 can't find orig instruction
> >
> > On loongarch, it looks like all users of the jump_table are causing thi=
s
> > warning. I will assume this is something that needs to be fixed at the
> > arch level (either in the kernel or the compiler).
> >
> > John Ogness
> >
