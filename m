Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC27F208B8
	for <loongarch@lists.linux.dev>; Fri, 26 Jan 2024 18:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706292083; cv=none; b=TsUjwRAB+kVfK/CUlPrcw00yD93RpIzKELqkzqA00+H/9HEqTE43vkhQcYnnP5g+zdXCtjcWT/RCSOFPAacWAuX+g4FSkp9DLjTm29CpiLGYu/oz2+P1Ktik328Gi5P5CE/SMPl5u+Wzn2sO8tCOvU7wLaOjs53uUjwJmlFcZTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706292083; c=relaxed/simple;
	bh=ILNAcCRYxFV2hBwDPjxHOp/jkyTMR71/MVIQgy9Ru1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oFhvWei4qSGu9qw0Z9QZPaXTcaRhAGjAXdCeO6STKf/4NwtezmWQLs8rCpR/S9bWw+LIBbZ9LPJcFaG2Z/nyNa1c69GRCO3aFFe3kMLXV22Bj0I5GXQbD2HVm10LWx/DdchQLz0hKay05ofsDihBg8649+Kcq2slQeiE4YJVHYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TdkR9bLq; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TdkR9bLq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706292080;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h1idEZmiqZ0PAWapQhsolthHnuhF6TvOu+W3q8ZLhUs=;
	b=TdkR9bLqmFXLrv3z8dXXpJcFDxhkponzxXEp23N1Ay8Tybsj5GzzDGvpdoGgno9NCCsgpy
	WReJjMMpA5NNomsAtDVHy4heUhHoeVwvEJoer3+wEdmxzfM0T4TPzLCI7xTsg0EBoeyK/d
	kNa5LYA3Me7H6dT0OTvaBdNj0FukAog=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-Of7g0Fh3PfmxrWI1YadObA-1; Fri, 26 Jan 2024 13:01:19 -0500
X-MC-Unique: Of7g0Fh3PfmxrWI1YadObA-1
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-5993598d215so649115eaf.1
        for <loongarch@lists.linux.dev>; Fri, 26 Jan 2024 10:01:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706292078; x=1706896878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h1idEZmiqZ0PAWapQhsolthHnuhF6TvOu+W3q8ZLhUs=;
        b=pq6ZmKBUxErljPNICrpIlpMMHo7EwYDcGfciJJpLQ/bkLGSnV8vSE96FBccJltAqfs
         qUuJdwXfFO7kRhuJRrpqzQiK/n5zBi0SxTjni+ilgUpyv7EAmlx8YWuUA4qwxOjAn2Dx
         iRR1wwwfwrP9oyo0VWTpcr4i8zewoFICdWOGlGI5pwwqRxMCCztrjhJp4PoTcOYtpiRN
         sv91ZhoWPCMAg2c2zMV7tUwZvd+Qc5x2nvR6OEa9aP3tQCTgNGArGTblH5/ATZgIod6y
         DllUcmQE151bg4lWFZxZYd9lxdWvRUcYbBKYLERlORirAaw77Ft8PBr/RIAAm3QFvVdr
         nsYg==
X-Gm-Message-State: AOJu0Yxl7sbEn1ZyZDrOhMAG3X7hkZPAFJGDCstyv5UkK1oIYF5BJG5Z
	3NgpQJOaPz2hn0t3iSfbDA6C6ZDXDMB/0PzslUZ+HxNzddFfopQlkN+dmijkdON62MsuitHR1Ut
	2cfua+1UcHgf5TZ6cM1+t2HzUeV1wyUuHFrZQCb4GuMnKD7si64GWtKOjK4nyEFeQo5bI2kaGr7
	0HQ88X6CCSFKCQOa7JLR5O3lm5DJVpMYy6
X-Received: by 2002:a05:6359:321a:b0:175:b57e:7be1 with SMTP id rj26-20020a056359321a00b00175b57e7be1mr63144rwb.52.1706292078528;
        Fri, 26 Jan 2024 10:01:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF/FiWt3RhBG2eZaUchUIE9MWYT+Vtp8D1XAoXVuiI7s21J/GldQs2rrbA47me4Q5yktW3RDvlHGE5BtjxRS6Q=
X-Received: by 2002:a05:6359:321a:b0:175:b57e:7be1 with SMTP id
 rj26-20020a056359321a00b00175b57e7be1mr63124rwb.52.1706292078152; Fri, 26 Jan
 2024 10:01:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231115090735.2404866-1-chenhuacai@loongson.cn>
In-Reply-To: <20231115090735.2404866-1-chenhuacai@loongson.cn>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 26 Jan 2024 19:01:06 +0100
Message-ID: <CABgObfYbv_rHto8eEWLB3srmCPj6Le7wDfG5XtYpUH17HBTcCw@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: KVM: Fix build due to API changes
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: Huacai Chen <chenhuacai@kernel.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Xuerui Wang <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 15, 2023 at 10:14=E2=80=AFAM Huacai Chen <chenhuacai@loongson.c=
n> wrote:
>
> Commit 8569992d64b8f750e34b7858eac ("KVM: Use gfn instead of hva for
> mmu_notifier_retry") replaces mmu_invalidate_retry_hva() usage with
> mmu_invalidate_retry_gfn() for X86, LoongArch also need similar changes
> to fix build.
>
> Signed-off-by: Huacai Chen <chenhuacai@loongson.cn>

Applied, thanks.

Paolo

> ---
>  arch/loongarch/kvm/mmu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
> index 80480df5f550..9463ebecd39b 100644
> --- a/arch/loongarch/kvm/mmu.c
> +++ b/arch/loongarch/kvm/mmu.c
> @@ -627,7 +627,7 @@ static bool fault_supports_huge_mapping(struct kvm_me=
mory_slot *memslot,
>   *
>   * There are several ways to safely use this helper:
>   *
> - * - Check mmu_invalidate_retry_hva() after grabbing the mapping level, =
before
> + * - Check mmu_invalidate_retry_gfn() after grabbing the mapping level, =
before
>   *   consuming it.  In this case, mmu_lock doesn't need to be held durin=
g the
>   *   lookup, but it does need to be held while checking the MMU notifier=
.
>   *
> @@ -807,7 +807,7 @@ static int kvm_map_page(struct kvm_vcpu *vcpu, unsign=
ed long gpa, bool write)
>
>         /* Check if an invalidation has taken place since we got pfn */
>         spin_lock(&kvm->mmu_lock);
> -       if (mmu_invalidate_retry_hva(kvm, mmu_seq, hva)) {
> +       if (mmu_invalidate_retry_gfn(kvm, mmu_seq, gfn)) {
>                 /*
>                  * This can happen when mappings are changed asynchronous=
ly, but
>                  * also synchronously if a COW is triggered by
> --
> 2.39.3
>

