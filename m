Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E6B3E714D
	for <loongarch@lists.linux.dev>; Fri,  5 Jun 2026 02:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780628370; cv=none; b=h4ou9GElTO2PyhOx/ygZXaP/+SuQxrWfBz0mHZAcIGOY2LOR5G1TbQfaOtg0nphWBPgsPsKnQ0kG2Hc0W8kQH+dyehryy+KPqmtGaul0L3HuMsQNnXVy6hbIVoM7sZnSBuAEyJ8anRXpE7+eNIRLgfyJjo3p/bzN6y8ON2ylPDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780628370; c=relaxed/simple;
	bh=nktvDi+xKyZUj7RdPCtd0VHwAzm5FVUJAEzFFALvsO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NTkDuWqhk+OYpS3iJHNm5cygQ8XCgQ/nN3RWhqNWM1avb/8MxooYhuxxk+ddKJNsQgIScEriX4zRQTQqMj3eRaht1xiByeeG4U/bk5cpK1nbx0jWSTxL4wv/dRJxc2+wgpoB/Nctqu08m8Sv8mWsV/iT1OAm3AjpY6xeWqkzTcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mv0FWlR+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mv0FWlR+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 479521F00899
	for <loongarch@lists.linux.dev>; Fri,  5 Jun 2026 02:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780628365;
	bh=2BnhDWEdcgX7kHMY2/Qtsi0IbV+ry1r6Jf76CFL9m/Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Mv0FWlR+dBWKuVb4Y9dVK3UDsi6Kbfy/4WlrzbUhl4MVyC50NqG6lqiq2Mre3PisU
	 8aS6f3Bd+atNg9r94lu8gArlIe4QVTlKVTEY+Us7L/QqHiTeqaJ/NnhjuqoUgJgM3p
	 Z/zlS5iONYLkRwGRA7O7A3ZY6AfBOmN4fDqO6qkNl57ijYQjKSUjtytymkfy9ViegO
	 zIxxLwxdpmSJ6i8p1SAV3noZ86iRH8+s06DMLxeq1GipiDKCABt9a7RiYRTZtjh4Og
	 brdfFE1nXgyDiEqj8Nr49HIti8m1k/2j+hKt29PlYORG91G+KRLO9NbRmTu4UBJr+8
	 PWDSI6fy7xWGw==
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-beeba001887so188725266b.3
        for <loongarch@lists.linux.dev>; Thu, 04 Jun 2026 19:59:25 -0700 (PDT)
X-Gm-Message-State: AOJu0YzpGFOkd8buiaBMrzAtzVr6wFCv+0ZW0UNk2X+FLPz/9fgixq14
	07fR7+wC4PpuZLYj/FSZtjwZEatHdtCyHp8G+u6nrtRYuq8xCFPrO2gE20lsKm9/wJHce8x3UZJ
	LN9Tpsfb7Jcf0FLjuPQALpVwywtN7DwU=
X-Received: by 2002:a17:907:6e9f:b0:beb:7979:47dd with SMTP id
 a640c23a62f3a-bf3738f1f81mr69734766b.27.1780628364047; Thu, 04 Jun 2026
 19:59:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <c36cab4c-0a91-4802-8693-a6ae3cee65b1@web.de>
In-Reply-To: <c36cab4c-0a91-4802-8693-a6ae3cee65b1@web.de>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Fri, 5 Jun 2026 10:59:44 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7cEN+zw6M8ZyJUNGNv=Q-M=vyG3ocwDqn41ZHQvBJVCg@mail.gmail.com>
X-Gm-Features: AVVi8Cdslvam3EeatbYu5wGh9V7ZzQ4_XDnT4ntjrZfZ1GNSK5Yng0l-ez8zUPA
Message-ID: <CAAhV-H7cEN+zw6M8ZyJUNGNv=Q-M=vyG3ocwDqn41ZHQvBJVCg@mail.gmail.com>
Subject: Re: [PATCH 0/3] LoongArch: More efficient data output in show_cpuinfo()
To: Markus Elfring <Markus.Elfring@web.de>
Cc: loongarch@lists.linux.dev, George Guo <dongtai.guo@linux.dev>, 
	Hengqi Chen <hengqi.chen@gmail.com>, Tiezhu Yang <yangtiezhu@loongson.cn>, 
	Wang Xuerui <kernel@xen0n.name>, LKML <linux-kernel@vger.kernel.org>, 
	kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Markus,

I suggest squash these pieces to a single patch.

Huacai

On Thu, Jun 4, 2026 at 10:48=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 4 Jun 2026 16:40:05 +0200
>
> A few update suggestions were taken into account
> from static source code analysis.
>
> Markus Elfring (3):
>   Simplify data output
>   Delete unnecessary braces
>   Combine two seq_puts() calls
>
>  arch/loongarch/kernel/proc.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
>
> --
> 2.54.0
>
>
