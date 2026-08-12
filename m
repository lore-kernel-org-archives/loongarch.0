Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979B4265623
	for <loongarch@lists.linux.dev>; Wed, 12 Aug 2026 05:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786511039; cv=none; b=e0whHu987hLm+c3TvqTppjNFxKc7SF+ha53RbOC3IlRhdypF/l/9VNOlgdcAQ+1e6Em8nUtxxxQoUPO2XEvygnW6dfhpKBOhYtC7QMrp6DQbEbGw0oIUQi0or1DiMQCg1lcsa993FRX8gdUz0cJT4lbRnpc67m/GRHK7f5SaYhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786511039; c=relaxed/simple;
	bh=P6quvHka82pMC4VdW7C7Qal5ft4yAf7yJoK8kb99VM8=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=HokqizZM9H4dKPbjpdT9v8ncL2jYz2CzmJ2zsOTOb5CqAy6S6NxDNQ19GGxVIrQEpqbjt7tqEdp4GgvLH3sF1zh8jIU/V/4ZMAMjI9z9NnTmhT+HJNQfih3lYYgu1olmEggTEyJN64EC/AudocJh81/fqLgdDG/NMIStjdUpKPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=T8Q7vFvU; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="T8Q7vFvU"
Message-ID: <f257f84d-580a-4db9-9f43-85e9bd4d6ebc@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1786511035;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kaUuGlJnD0CcwE1VdpdGZnYU6rLAQXVP8/gj94h7utw=;
	b=T8Q7vFvU4/c8Qzv4nYbcsK3xEYNs70S/2UyWgB3RvOpWvowkCsxNj8eY2Pcyb/7gRjnPVI
	0YZOstpu/6SyrYFBw3fq0y39UYHDgC1R5lEhsBXW6r4gZqzOzg6VvqzCmdxKTqkDQ1eoKc
	HvoWza5M38lRwCD17CLhD7q6y0p3vcY=
Date: Wed, 12 Aug 2026 13:03:32 +0800
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Cc: cui.tao@linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] LoongArch: KVM: Remove unused function
 kvm_arch_flush_remote_tlbs_memslot()
To: Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>
References: <20260812040132.113812-1-maobibo@loongson.cn>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Tao Cui <cui.tao@linux.dev>
In-Reply-To: <20260812040132.113812-1-maobibo@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT



在 2026/8/12 12:01, Bibo Mao 写道:
> Function kvm_arch_flush_remote_tlbs_memslot() is not called any more,
> and it is unused. Here remove this API.
> 
> Signed-off-by: Bibo Mao <maobibo@loongson.cn>
> ---
>  arch/loongarch/include/asm/kvm_host.h | 1 -
>  arch/loongarch/kvm/mmu.c              | 6 ------
>  2 files changed, 7 deletions(-)
> 
> diff --git a/arch/loongarch/include/asm/kvm_host.h b/arch/loongarch/include/asm/kvm_host.h
> index 23cfbecebbd7..5682b8c847d1 100644
> --- a/arch/loongarch/include/asm/kvm_host.h
> +++ b/arch/loongarch/include/asm/kvm_host.h
> @@ -350,7 +350,6 @@ static inline void kvm_arch_vcpu_block_finish(struct kvm_vcpu *vcpu) {}
>  static inline void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot) {}
>  void kvm_check_vpid(struct kvm_vcpu *vcpu);
>  enum hrtimer_restart kvm_swtimer_wakeup(struct hrtimer *timer);
> -void kvm_arch_flush_remote_tlbs_memslot(struct kvm *kvm, const struct kvm_memory_slot *memslot);
>  void kvm_init_vmcs(struct kvm *kvm);
>  void kvm_exc_entry(void);
>  int  kvm_enter_guest(struct kvm_run *run, struct kvm_vcpu *vcpu);
> diff --git a/arch/loongarch/kvm/mmu.c b/arch/loongarch/kvm/mmu.c
> index e104897aa532..2c08402bfd3e 100644
> --- a/arch/loongarch/kvm/mmu.c
> +++ b/arch/loongarch/kvm/mmu.c
> @@ -939,9 +939,3 @@ int kvm_handle_mm_fault(struct kvm_vcpu *vcpu, unsigned long gpa, bool write, in
>  void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
>  {
>  }
> -
> -void kvm_arch_flush_remote_tlbs_memslot(struct kvm *kvm,
> -					const struct kvm_memory_slot *memslot)
> -{
> -	kvm_flush_remote_tlbs(kvm);
> -}
> 
> base-commit: f5bbbfec59b4e2fb7520a91de3df8a6174325d6a
Reviewed-by: Tao Cui <cuitao@kylinos.cn>

