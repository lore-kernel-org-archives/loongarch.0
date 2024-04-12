Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A68B148FE0
	for <loongarch@lists.linux.dev>; Fri, 12 Apr 2024 18:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712947312; cv=none; b=e67V5DzouqhBw2Vh8wH1IwlSaVf/1umEzuYSIgMOB8cpsTbpRaLsHt3kkbFNiNdLYs3tDezOcbJ4avMMAe71HFtpHZQ1QzkFbYDikldqEhjgO7DLwZstUpxzr64EG0go7PVhLd9RUXPPFgOnB1wLdGemml4ao1C25xSG8ddlLoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712947312; c=relaxed/simple;
	bh=RGNi9rzXqhjGiFDRNP+kvJNM7r5DsV922PEV+oBFzbA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Snn6uFBMcVhQktbJsnxF/GHEe8QEVqo7WIjthX1ZusGX09TLwcrw7+G/al4I79kycsel5t7fydVHlzVc1NSKWZ0Rcmx3Ioz0GTkAkaJFns+W5nEQrIVheSjejm86ucWmj1fbI5FlU0YIj56tjUGJyndntbi9l/jzImPIP3+WZk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SLOkBsRq; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SLOkBsRq"
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-dc647f65573so2263479276.2
        for <loongarch@lists.linux.dev>; Fri, 12 Apr 2024 11:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712947310; x=1713552110; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PwPJQIO9PCSTWhMKnDqZU+F6U0uKGIbW0CebiQxQU+E=;
        b=SLOkBsRqoPJf8l7NVWbVy2PlrieDFGe13OWyzfV35KyttvJiPLz8A6XZd1eX0USAbL
         gwbe9p7oIKmTFKYqq5b3knNABb0asU3O3nYVpTP8WG7/G86Db3SHy5S74dVH5/xXsp2f
         chzpZUYgi41mIZUbvr4z/R6UENO9QcMx9deXekskPjKC6cdJrC3cPVgw2jSVMh7zgwHy
         Wjwkf9d+uR54mGWNm2LAN056Hs6etHO6EBbHvoi96IIfRryv7djIlEq33y2Y6QKdliYg
         A2Ir13OKh20Bcx0sI1rkobGWuvoSFJ+cLlI2ESGlE67+L6mosp88CfZZ6j4xFvP/DreH
         K9JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712947310; x=1713552110;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PwPJQIO9PCSTWhMKnDqZU+F6U0uKGIbW0CebiQxQU+E=;
        b=SC4SMz9BAiL0AfvhQzuEiF4BsIzhaPItHKMCT6rYYQjy/iMvVltwEIYcDAmXfUKqVB
         4+uT2uam3UVjof6KgzN8H6QQpX7fR67Hv+hEnBlWpblBpx21tosqlkXjgxFxu3WSH0mD
         06MXlkntgTLpR3sz0N+4i4ekfJXxZZB4DSWX674/kXShZO9gJqfhwdr3igasoXvbkbLS
         CpQKGOLeY0tbomAXMHxLq78dNoXKxF7n5qHDzRN2h79erE58vP+rlUyjrATRB/AwAmib
         uxk+By3ReK3/L9GV/Mv1L5QRJyJkmaNZSo4/0uCcOgCAYrDKr6cZL+ZMam3t/gnlP2C4
         ucsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNSS4Wi6hpMYmz46iFCFxWlZSAL0MEseJi8TUyKBnWZzyI2KKGUSKAP6B9tRE/X0THOBhy8+7u5e48/iLmquZv0BBGDtm6tcgx
X-Gm-Message-State: AOJu0YxHAveO0SaiuyJaLvjIxZlN2ojaw760oJqQIbPUxqSFD8/z30Ea
	zWl2vPgZofsF7D1m5ntGq4EVjzbY8NHlqdV3VJJa4bfUT8cQCY7lN+DyK8T3zqoMvElAdHbWqb0
	mjg==
X-Google-Smtp-Source: AGHT+IHybk309r9yeTtvrGIJ+BHxaTibsx4Sw52ihb2S/NcXRw6GqWp6D/rTYKOn+I51ZDcn7hlg9iX2MrM=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1081:b0:dc7:8e30:e2e3 with SMTP id
 v1-20020a056902108100b00dc78e30e2e3mr936126ybu.2.1712947310492; Fri, 12 Apr
 2024 11:41:50 -0700 (PDT)
Date: Fri, 12 Apr 2024 11:41:48 -0700
In-Reply-To: <20240412084703.1407412-1-wjduan@linx-info.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20240412084703.1407412-1-wjduan@linx-info.com>
Message-ID: <ZhmAbBGOvldKdkZu@google.com>
Subject: Re: [PATCH] KVM: loongarch: Add vcpu id check before create vcpu
From: Sean Christopherson <seanjc@google.com>
To: Wujie Duan <wjduan@linx-info.com>
Cc: zhaotianrui@loongson.cn, maobibo@loongson.cn, chenhuacai@kernel.org, 
	kernel@xen0n.name, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Fri, Apr 12, 2024, Wujie Duan wrote:
> Add a pre-allocation arch condition to checks that vcpu id should
> smaller than max_vcpus
> 
> Signed-off-by: Wujie Duan <wjduan@linx-info.com>
> ---
>  arch/loongarch/kvm/vcpu.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/loongarch/kvm/vcpu.c b/arch/loongarch/kvm/vcpu.c
> index 3a8779065f73..d41cacf39583 100644
> --- a/arch/loongarch/kvm/vcpu.c
> +++ b/arch/loongarch/kvm/vcpu.c
> @@ -884,6 +884,9 @@ long kvm_arch_vcpu_async_ioctl(struct file *filp,
>  
>  int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
>  {
> +	if (id >= kvm->max_vcpus)
> +		return -EINVAL;

Do you have a testcase for this?  If I'm following the LoongArch code correctly,
I don't think this is actually necessary.

In arch/loongarch/include/asm/kvm_host.h:

  #define KVM_MAX_VCPUS			256

without a #define KVM_MAX_VCPU_IDS in loongarch/, AFAICT.  And so the common
code in include/linux/kvm_host.h will do:

  #ifndef KVM_MAX_VCPU_IDS
  #define KVM_MAX_VCPU_IDS KVM_MAX_VCPUS
  #endif

LoongArch's kvm_vm_ioctl_check_extension() reports that to userspace:

	case KVM_CAP_MAX_VCPU_ID:
		r = KVM_MAX_VCPU_IDS;

and the common kvm_vm_ioctl_create_vcpu() does:

	if (id >= KVM_MAX_VCPU_IDS)
		return -EINVAL;

and the common kvm_create_vm() does:

	kvm->max_vcpus = KVM_MAX_VCPUS;

with again no override of max_vcpus in LoongArch or common KVM.  So unless I'm
missing something, manually checking max_vcpus in LoongArch's kvm_arch_vcpu_precreate()
is unnecessary.
