Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B365B1DF248
	for <loongarch@lists.linux.dev>; Sun,  9 Aug 2026 04:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786248462; cv=none; b=jy4I3jqEOYZrt+8//H8obqSBA2Oj32X58zeQOWJKuAuHbr5LRTOeqdNsjZ8CAlK5DwTfneIVMOmznKAEq797dhpKUNn/jCExumwGkHVvcOM7VNUrVnLKnpblx9Vrnt5hYagRNMi/+iaJXF85OErzSkMiweT/+Nz4YXg80qoW2yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786248462; c=relaxed/simple;
	bh=4E4YvNrn4yDUOCzuehcRYYYu2UMPIlLOvAvw0Hw1J+Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dUc8KanPhjymLIC6CUgl4E2dD4Ax8vQqUm3Mr8gpx7+zny4U8giKUq/HtHpPK53TUSNbGxA0MFfkf+ECTkohUgq7UxCTg7nMlNWM9mG78ZD0sLRaY/KNSglnxgIS43xp1D9cHt6IXKbZljxsex1iT5CQFNUXQVjPI29JPwf1YJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UMDhbkUv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UMDhbkUv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 906481F000E9
	for <loongarch@lists.linux.dev>; Sun,  9 Aug 2026 04:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786248461;
	bh=L8CSqrRVh74ENGvcKVCmRBoVfhbd7ZDNHVHlxKcRdBo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=UMDhbkUv71ew0A9H0wOkOGtc7OkBhKRxhsp5U5TyHBVfrrvF7vhOb40Z8mVvePlH2
	 2J9QFiVv4rbd7COGAEid7hgFdo1qmyLkng3dq+2WypcfgLwfKrDSO4g+DtMduQYCBS
	 6RvP4BKdLHM7KfL/3YdVLgaIGi8vjH+lqeX+xylkKpdvwkZACfRDh5Kl4KzHRls1ow
	 sPdwU97lLH/dWHBPtkV/d/wju6PElUFsBWIQLsg2DlN16au8k3Jo6y73JickEWGE2F
	 HTbCPdLeace9pEk91Krzd3EMQAcNbeLbgH/4oALKqIKRqigtLQ4a5nVSX8k64jdmuH
	 pFAYwhGkT1PqQ==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a1f7f42510so662421a12.0
        for <loongarch@lists.linux.dev>; Sat, 08 Aug 2026 21:07:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrgL4SOvqEEOI/6unELLtOS3VKweASqzsLttFvBxxzxdkg7j07YLwDDgQ5KzLaLZVOOxNH+jLHB/bU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzve6coTuaD1OCOE6zNkIcv++GuaAKI2xgWpdhY/+7tggJi1ijB
	JLTgTibjeLPPauLiGx5bZ7xNvdLyULfL1YB4tmnayR4dYtUESHA9Og9cKC/d1lnA4DqVJfTf9dz
	ETpcsmOE1xN7E+Wy0ntFIDkzOAL6U8Kk=
X-Received: by 2002:a05:6402:2803:b0:6a1:b23d:e962 with SMTP id
 4fb4d7f45d1cf-6a1b23df9c9mr9912252a12.8.1786248460294; Sat, 08 Aug 2026
 21:07:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260804082153.1220709-1-maobibo@loongson.cn>
In-Reply-To: <20260804082153.1220709-1-maobibo@loongson.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Sun, 9 Aug 2026 12:07:30 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4PcWnwqYqo3swkowKzUvGENfHhFktHaghsLFSaNkkLqg@mail.gmail.com>
X-Gm-Features: AUfX_mxW-l2u3yg4EChdCTRWOw6G7RCdKyZltYZs2wXsuNmeBQcOv7feOlDwj_I
Message-ID: <CAAhV-H4PcWnwqYqo3swkowKzUvGENfHhFktHaghsLFSaNkkLqg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: KVM: Set cpu before IN_GUEST_MODE is set
To: Bibo Mao <maobibo@loongson.cn>
Cc: kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Applied, thanks.

Huacai

On Tue, Aug 4, 2026 at 4:29=E2=80=AFPM Bibo Mao <maobibo@loongson.cn> wrote=
:
>
> In function kvm_make_vcpu_request(), it will send IPI to physical CPU
> when vCPU is in IN_GUEST_MODE mode. And physical CPU is set in function
> kvm_check_vpid(), and it should be called before IN_GUEST_MODE is set.
> Otherwise IPI will send to wrong old physical CPU where vCPU is running.
>
> Fixes: 2fc3bd86db4b ("LoongArch: KVM: Implement basic vcpu interfaces")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  arch/loongarch/kvm/vcpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
> index 20c207d80e31..fd0dd22a7162 100644
> --- a/arch/loongarch/kvm/vcpu.c
> +++ b/arch/loongarch/kvm/vcpu.c
> @@ -300,10 +300,10 @@ static int kvm_pre_enter_guest(struct kvm_vcpu *vcp=
u)
>                  */
>                 local_irq_disable();
>                 kvm_deliver_exception(vcpu);
> +               kvm_check_vpid(vcpu);
>                 /* Make sure the vcpu mode has been written */
>                 smp_store_mb(vcpu->mode, IN_GUEST_MODE);
>                 kvm_deliver_intr(vcpu);
> -               kvm_check_vpid(vcpu);
>
>                 /*
>                  * Called after function kvm_check_vpid()
>
> base-commit: 075b74841bd0065a3bda3440873c747938e69b68
> --
> 2.39.3
>
