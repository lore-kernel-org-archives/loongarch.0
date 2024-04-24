Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F5C85925
	for <loongarch@lists.linux.dev>; Wed, 24 Apr 2024 03:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713928310; cv=none; b=KeJBAt3QHFE+u4JlRBGwp6KjzknYWz7lSs5HUySwHVOZc5j3KfWOke61z/K8tzNxiVchoQGZgBXrrsDlHEGC7ERffsEGLM8vtDW9JhI0O2BBiETS/ptljNsrlM3dcUtx/x+gffGIz2pI2iAaB+7pNKp7OGU68XdY8Pg0HNe6v9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713928310; c=relaxed/simple;
	bh=UyarDLJm818fh1aTpD2RkbQ0/HhxARpsVNwSkNoBwEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b+GqRPk6GSmbRclnivtfOVyVUm+FQCkcafVs95KQD5xKTIehm3TsAdH7kR61l0oYD//UOWUzrniE5fGnrfRbRW5I/gy4wBgmsi0pj0utj983noyUOWMHL4/KKJLSTZghGugYTlk/Qatga94DyaT/XahhfeUpaN6jccznW6gVFr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uADnoj4X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uADnoj4X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24F61C4AF0B
	for <loongarch@lists.linux.dev>; Wed, 24 Apr 2024 03:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713928310;
	bh=UyarDLJm818fh1aTpD2RkbQ0/HhxARpsVNwSkNoBwEc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uADnoj4XNWf+GOdHb5EFyKOs++TfjS8KFG1vqAIQZHPzvRglW84F9pN9KkGBcecK8
	 mPRMa76d55ZCO8p/g8aXmSYg8KPrP2Xe/WOdHDKtL3CC6SJm0v4vSZVEzaIhT5Z7SV
	 lur7NZEeu3dzI9ylNvFtjKMw63O4hCkdy2coKJgth+rydXTfTAMv6fU7YOYZBbr8c6
	 0FPQYjuMDxs8msTdO/N5rNjgYgC5lMNMCcKYogVtVmGEow9gdUd/xwC2jEYWKZR+P/
	 k+fe0tD0ECwC8IQYdrgPk3/t2h/hmiPtKjewL9ErhznaABAMx2uaolBWbIl9JoOtbE
	 AW0uEju1Jnwww==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-518a3e0d2ecso9501929e87.3
        for <loongarch@lists.linux.dev>; Tue, 23 Apr 2024 20:11:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUYHBbwo2/1o03CqQcvHE5tK0z2MBsLROYhfn01bizJ/+vzwGPYHdrghT8OhdTtBiLTqIy+8hUUsWbTi1CZ151kb56EEhU19pBI
X-Gm-Message-State: AOJu0YyJoK0NdDu1lOJ75I1PtvZtUfyOBSYx4qoV6dHxUKbEjBXwaJh3
	Nm6NDFsOvwG3hnwV/J3fIT3bO6gb9RU1YBudLYWcdl/pZtkL9SN0uN5yVJhVBeksezh5KObRghW
	+3yIkXyT6st3FQiLnl4BBDhktanE=
X-Google-Smtp-Source: AGHT+IHV7f/90zOMTYFIY3BIf0OhGjiubsdyuLJlkyqQzhzjXWf4I96WT55HKfcE9PHwaMb0sTgdojt5rUIeb84uoq4=
X-Received: by 2002:ac2:44a6:0:b0:513:d5ec:afb with SMTP id
 c6-20020ac244a6000000b00513d5ec0afbmr992362lfm.40.1713928308279; Tue, 23 Apr
 2024 20:11:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240423074257.2480274-1-chenhuacai@loongson.cn> <1f15f7e3-32ff-486f-8e6f-bbe9183b05e5@web.de>
In-Reply-To: <1f15f7e3-32ff-486f-8e6f-bbe9183b05e5@web.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 24 Apr 2024 11:11:36 +0800
X-Gmail-Original-Message-ID: <CAAhV-H5V9_Q-YH-GPevgeqH-2Vd3cyOcVzMiD-F1_gZsYpj5-w@mail.gmail.com>
Message-ID: <CAAhV-H5V9_Q-YH-GPevgeqH-2Vd3cyOcVzMiD-F1_gZsYpj5-w@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: Fix access error when read fault on a
 write-only VMA
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Huacai Chen <chenhuacai@loongson.cn>, Jiantao Shan <shanjiantao@loongson.cn>, 
	loongarch@lists.linux.dev, loongson-kernel@lists.loongnix.cn, 
	linux-arch@vger.kernel.org, kernel-janitors@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, LKML <linux-kernel@vger.kernel.org>, 
	Guo Ren <guoren@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Xuefeng Li <lixuefeng@loongson.cn>, Xuerui Wang <kernel@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Markus,

On Tue, Apr 23, 2024 at 5:45=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> > As with most architectures, allow handling of read faults in VMAs that
> > have VM_WRITE but without VM_READ (WRITE implies READ).
> =E2=80=A6
>
> Will the tag =E2=80=9CFixes=E2=80=9D become relevant here?
Yes, you are right, thank you.

Huacai
>
> Regards,
> Markus
