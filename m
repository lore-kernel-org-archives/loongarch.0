Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EE6F382368
	for <loongarch@lists.linux.dev>; Sat,  3 Oct 2026 04:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791000144; cv=none; b=LK2ahrwrvAxIVwz+jtx/uHetzZ341yDCB+KqhbSUGNRPNvJmm8L7qERVROCTSlV7zWRLib9oZjcxFn5xjq3WUl++QjEQ5nOZYzb8pqfXXgCyS9AoczBqa+eo+lt/5+kDgReAuJl399wEjmxirdTDHUSgYi9xeEfLam/0h6vhf7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791000144; c=relaxed/simple;
	bh=5Q0kOlBKlvQjrqJ2pLYH5gqFTYvbTL2pBiQx6XGdVTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fv/w0S+ta0hj9RQUFHAW6rt16hzjogiKjCdW0PkIULshmj+k3grfI7R2nx7x4CNaIkYg1mgH6ZliigfXHQmC0gp4mXmuHB4fspPSP1eZGj3WugsDCVtyuwEV85Uk1XcwcVep/272OggKM3OlWKblFKCz8Iw1IOxGfeOyDCDl0y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YT/lzqOV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YT/lzqOV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 221271F000FF
	for <loongarch@lists.linux.dev>; Sat,  3 Oct 2026 04:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791000142;
	bh=MuihY+3XOWOpC5dOkAt4kX96ocbnYzCapGNTqps8Dhw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YT/lzqOVMtB5HJHmXF1RA3hyOp6oTNcBv5KuVrkxm4Tr6w++odc2NRK52W3aHmc1i
	 XcyIcPm5D3bn4S7hPyt/1tUAhgrZg3bp06swGyt9OwKmuE9fpDBdFg0SVymlzI0Lx4
	 3ou/3gMi4MPCp5mo2+golERAgC5c90UNq7Glg4XAKQZQLwtl5FGimmRVo1eLDMwnwE
	 hgpCmTQ8d5oUGCXVZOjaGUQOOvUvkO80qxJBDaqDnX8/9mdhFwEL3Tdr3eA/QraTLI
	 K5SJW3g1Gp/VSaTfwNPiaxJaqI1N/ph8Fb4juzF56kjbpbArrkrnlUZrI2z/HCfbFd
	 Lw11h3n8u5/pQ==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a601ba6870so285195a12.0
        for <loongarch@lists.linux.dev>; Fri, 02 Oct 2026 21:02:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByPRbJTmTt1BPltC4M/Qcx+UZrIn9Bf+Rfpc4vh1+vGGPpkpqktWAPr0P7kfxYDD2+f3QG2bm6+NIg=@lists.linux.dev
X-Gm-Message-State: AFq9FYK9BoiyJAhliAJzE5kRZVgx6LeRXt9eghnXWonhNNCXQQrbUDba
	cNw1tAVe7ZbhtBF52U4OHdqkHcYLOhPV8T+IMnZ+E7jgZOX6EWoVaiLPMaxL1tXrFXMHV5QQjLR
	xzr+b/7LHxGmK7p1tcnUMpdjtdPOeOMg=
X-Received: by 2002:a05:6402:13ca:b0:6ab:1e8:8b7e with SMTP id
 4fb4d7f45d1cf-6afada11773mr1408726a12.32.1791000140360; Fri, 02 Oct 2026
 21:02:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923011803.1057945-1-maobibo@loongson.cn>
In-Reply-To: <20260923011803.1057945-1-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sat, 3 Oct 2026 12:02:06 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4cB4A8kx1Ofsvk+-kEOMbv2kkBmRFv9PZEgBueDxN6KA@mail.gmail.com>
X-Gm-Features: AclHuK-kKHSj9T6BReavlusIsm1zDIL-x0f708Ue8Plb_-rvXrLHhN0sDUJ_pYE
Message-ID: <CAAhV-H4cB4A8kx1Ofsvk+-kEOMbv2kkBmRFv9PZEgBueDxN6KA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] LoongArch: KVM: Code cleanup with MSI intterupt injection
To: Bibo Mao <maobibo@loongson.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Tao Cui <cuitao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.


Huacai

On Wed, Sep 23, 2026 at 9:25=E2=80=AFAM Bibo Mao <maobibo@loongson.cn> wrot=
e:
>
> Here is to remove some unnecessary parameter checking when injecting
> MSI interrupt, include MSI level parameter and vcpu::arch::dmsintc_state
> NULL pointer etc.
> ---
> v1 ... v2:
>   1. Remove function dmsintc_deliver_msi_to_vcpu() and inline it in
>      dmsintc_set_irq().
>
>   2. Keep return value with -1 rather than -EINVAL when level =3D=3D 0
>      in kvm_set_msi(). Return value with 0 is one option also, now keep
>      similar with other architectures, will modify this in future when th=
e
>      final solution is made.
> ---
> Bibo Mao (2):
>   LoongArch: KVM: Remove parameter line when inject MSI
>   LoongArch: KVM: Remove duplicated checking with DMSI irq injection
>
>  arch/loongarch/include/asm/kvm_dmsintc.h |  3 +-
>  arch/loongarch/include/asm/kvm_pch_pic.h |  2 +-
>  arch/loongarch/kvm/intc/dmsintc.c        | 37 +++++-------------------
>  arch/loongarch/kvm/intc/pch_pic.c        |  6 ++--
>  arch/loongarch/kvm/irqfd.c               |  4 +--
>  5 files changed, 15 insertions(+), 37 deletions(-)
>
>
> base-commit: 93f51579e7df248780214094418f205253383cc5
> --
> 2.39.3
>
>
