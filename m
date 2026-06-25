Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C012F5321
	for <loongarch@lists.linux.dev>; Thu, 25 Jun 2026 18:20:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782411602; cv=none; b=sFDsboLVyis5uabtg3otnXCv3Frhue+HCjvOlmDj25ZhF8gM9bmN9EEupvW1z+tvX2PN5e1NR5VIJjDg4DHLW/SFj63zsfyNyj2IyyC6d0f/R5in90HMWuP+5pEJ8L0uaQlFhbSn/xo+mgT15pX7txrVUSlgSZ0DCMlr1fgLQLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782411602; c=relaxed/simple;
	bh=XxndvljOt9uUmD9D72rN/iNmVCcGubaSjNNlVCf2UNQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VM5oyiioVfDrkXndiPY9cMWuWGcAfz9GHTQpm9r5nXWFojUUREamQlhqxW+qRGphQxr4zjs8FSBqys7V5wP1TsGkbkDWsVrfCvhqW0NRse2eUWD9EubBk2igh6FTO7A+JK2AM3qq2Mbh2Sn757VAjH69bx46zegPoHyJKbMVpLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ni0G2pwR; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ni0G2pwR"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c7645ac9b1so1263995ad.3
        for <loongarch@lists.linux.dev>; Thu, 25 Jun 2026 11:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782411601; x=1783016401; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ymb11MHWr84mbZGvyE15DfTishs1pDuYphEFb//5g8g=;
        b=Ni0G2pwRqk2c9R6EfOTUWAHoOvr9Afbp89GZfBpMywFzthW/2pww+lkFoqQIcV2uqe
         5s/c5a++cL57eAFAcWEbXUkehd4qTQ/WCEZrR3x+UvsDtZCLfbnVJuJelKnOmoeSXqQI
         NstWRfPngymaaMfjozhwkmqmC17+dQ8G0EthrdyZCaUgPOniVNOaPS3LnW4TJjAkTpti
         wd0iuNSBUu0JCKqyryNgWKZPliAyg01Hyq43Q1MjS4IfJXgoG47EducM565d0hitQ6IR
         GLsT80lmUX6+KcM37sZKdBb8Q/R3tc0NSEVpJDzOuEVNU+fNwd/MWErU3y18ShxvSID2
         cVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782411601; x=1783016401;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ymb11MHWr84mbZGvyE15DfTishs1pDuYphEFb//5g8g=;
        b=HT/Cs3bMFuLEQuT8HzH36vt4fiLsXSROU2QAgAXkMpSj/UkML4DWp8J0+iZiT94bZq
         yD/hVbXuo0LOe++9Db8j+ssdjaYf4X87iA6jherr8YxaDRqGFl6La+6vpVWgkMcUbLd5
         ND/5yA3QdzCmLWO5Z34RzgQONqqoy6Pa2Da3UZseWprVha9lgpwiUhCLCiTjsG/lAdxQ
         FqZVD068cQBwbRI5aTzz4YO+PfEhYRiaZVaKumBYNdU2M5jbhQGaYjMfgJFiv1zuhOuh
         vegRJDx4KhYd9mtkmWM4TAZzw/y3Mz/gNIMd+0+quDoD6/s7DGw4gHVlm7lhotiZs2bE
         pBSw==
X-Forwarded-Encrypted: i=1; AHgh+RpJhxpby01MYHL5DmCYnTakyHTHMU7RVlQntQKUgrtmJ6i5eiOWgKPAA870gbgOi3rRefMQczzLDLU=@lists.linux.dev
X-Gm-Message-State: AOJu0YydykqQy95McDqcW8g2PuJYvx/C/2LeMmo9PVqog9ajwl5kS1vX
	yAshcxo4q80fD03+Ss/jyRLIS0PwO0Cfg6Y2DR8OqXZ9QEm4V2X8CoHabgqgkWjSMP6Lx++NPSi
	0Ib6kdw==
X-Received: from plmt4.prod.google.com ([2002:a17:903:3d44:b0:2c7:ed23:f48b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d482:b0:2c6:8d95:fd6d
 with SMTP id d9443c01a7336-2c7fc74bd33mr35612465ad.21.1782411600543; Thu, 25
 Jun 2026 11:20:00 -0700 (PDT)
Date: Thu, 25 Jun 2026 11:19:59 -0700
In-Reply-To: <20260527-kvm-locking-docs-v1-10-4fe8b602ff47@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260527-kvm-locking-docs-v1-0-4fe8b602ff47@google.com> <20260527-kvm-locking-docs-v1-10-4fe8b602ff47@google.com>
Message-ID: <aj1xT7XkSpkqNFAI@google.com>
Subject: Re: [PATCH RFC 10/12] KVM: guest_memfd: Clarify comment about
 gmem.file vs kvm->srcu
From: Sean Christopherson <seanjc@google.com>
To: Ackerley Tng <ackerleytng@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, vannapurve@google.com, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Wed, May 27, 2026, Ackerley Tng wrote:
> Clarify the existing comment about synchronize_srcu() and
> kvm_gmem_get_pfn() to provide further context. Explain which
> synchronize_srcu() prevents races with how kvm_gmem_get_pfn() is used.
> 
> Also point reader to documentation for better understanding.
> 
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---
>  virt/kvm/guest_memfd.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
> index 69c9d6d546b28..f2218db0af980 100644
> --- a/virt/kvm/guest_memfd.c
> +++ b/virt/kvm/guest_memfd.c
> @@ -711,8 +711,13 @@ static void __kvm_gmem_unbind(struct kvm_memory_slot *slot, struct gmem_file *f)
>  	xa_store_range(&f->bindings, start, end - 1, NULL, GFP_KERNEL);
>  
>  	/*
> -	 * synchronize_srcu(&kvm->srcu) ensured that kvm_gmem_get_pfn()
> -	 * cannot see this memslot.
> +	 * This is called when memslots are updated, after the old
> +	 * memslot container is no longer in
> +	 * use. synchronize_srcu(&kvm->srcu) was called there, so
> +	 * kvm_gmem_get_pfn() from KVM's guest fault handling cannot
> +	 * see this memslot. See Documentation/virt/kvm/locking.rst
> +	 * for more information about kvm->srcu and the memslots
> +	 * container.

If we want to add to this comment, I would much rather do so as part of an update
to kvm_gmem_release()'s comment as well.

https://lore.kernel.org/all/20251113232229.1698886-1-seanjc@google.com
