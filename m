Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E7930648C
	for <loongarch@lists.linux.dev>; Thu, 25 Jun 2026 18:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782411128; cv=none; b=khNjJxysQVMGpqAUKT6WKqK7UfcP218f6q3/ySZoWVXOMflI9VjgJd3myKF1qCGY1PEuukI0L0l2Mm4XZIqBKxgOVdN8m9FdrMVLGsQuP0AoeJVTFToAHh4yrHqxP2nHBZZyzHYebCkW+R+bH13dMgFbBbKWvQFPtwQNqDR3P7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782411128; c=relaxed/simple;
	bh=1PYPrh5cmW7j92HgEZsxX+MtgSZruUXIrXzPkSjifnI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=b+JEjB9ZCeE+SnRoRAPV5A9i0Fsv+vZ9aA5e0lYJhVtCZoN+RaGDbKPPRBR1C/07o9fscgbeCG/dr8OE8a8a1TQ2hBw3hmRye2UXDwBFqrHszDO09/Fx/hSfR4B9N56j4YUYaPQYJNknmd42Wyra5C3HfqTag5Av/VfvV50Qhig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PRR1/y2h; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PRR1/y2h"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c889d1eebafso162767a12.0
        for <loongarch@lists.linux.dev>; Thu, 25 Jun 2026 11:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782411126; x=1783015926; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ytZubqtXwlHPvZAN+p1oFC5/Ov6kfqDqplPxrT9CpGE=;
        b=PRR1/y2hRaizMlh9TsEWvj0doZQHAZsxE/4XxP6bgTceIRYq8QL9As9fGsPmcqxnfT
         upBj7hUYk3ua7aSROJlj21UkHvJ6jCpQg6GR4PTmBt8qPdSAlmX1lqvIIXwW8LmjukKi
         EpmJeaGk2okjnQ8e2MIC9MAjSaQKaQagxCOeydL2CRU0ogF/wYfU7z/TRESc/dqYSNDW
         Hlyz1E+9WPuVKbyx6R0Tvg9Y9Ac34qcmZTM8Mjxz95eGUn3SOaFB8e1OwYtIiA/5FWiX
         i0PbPflfRbGC7Y6Lk79x/ST/3TjPTGHPeowLyLzai6VIIDLDUQFy5MPnvssm019L22v9
         5ZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782411126; x=1783015926;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ytZubqtXwlHPvZAN+p1oFC5/Ov6kfqDqplPxrT9CpGE=;
        b=FAr0lRMQ5pFjpHvzyeHU2LWwGN4QojVMbKfnS5dwHUdwl+5X8ikWHskI/OJ1XSTVPv
         jgcXZqCEibbidXNo6+FmZiHv7MaiXdhBh5ly584SQ25u+JE/u0xub2q3XuIB6YZ4Fv43
         iaYwpg8J0IP8NUUhURqJReKrLx22E7AH4WTh9z7BT5/q+fibPp/ZdA5+YzuDGtMreYsu
         7pAJ+uA0Oh8ULpPUdnmCcQeTCWS5VTLf0NGz7XkvBBQbbJCOrQtI6tUWA5efRVj4pqDd
         Md/+3JZxnvwWTEnBhEWDeo5eY9SwkADfggDw5EkSDbkjVYL+o3QDDonAAcbHi5jWNFkE
         hhHA==
X-Forwarded-Encrypted: i=1; AFNElJ8CHKnRmQPWuF9V6DEPktwp06ZZcodlh/04fUMIZghBU3iQaeESl9r9U/Ok1WCZ16DUZsJHoXmAwfU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzEzosOOHMXBr+VP6bAB2XXiFcX05GALKqO61W6sYXt4bNwxnNG
	BVNGdK88a0mdqkDdlzFe551QzsW0Yx8VmXWkBOOM7obCmUohxxHuWMuwiaOKljOsymi1FnMJIpm
	xVKz2/w==
X-Received: from pgbfp5.prod.google.com ([2002:a05:6a02:2ce5:b0:c8b:ed9c:4468])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:1bc1:b0:3bd:203b:b587
 with SMTP id adf61e73a8af0-3bd4b021e47mr4245885637.40.1782411125978; Thu, 25
 Jun 2026 11:12:05 -0700 (PDT)
Date: Thu, 25 Jun 2026 11:12:05 -0700
In-Reply-To: <20260527-kvm-locking-docs-v1-1-4fe8b602ff47@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260527-kvm-locking-docs-v1-0-4fe8b602ff47@google.com> <20260527-kvm-locking-docs-v1-1-4fe8b602ff47@google.com>
Message-ID: <aj1vdb1VxNilPa9i@google.com>
Subject: Re: [PATCH RFC 01/12] Documentation: KVM: Elaborate comment on kvm_usage_lock
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
> The original comment talks about cpus_read_lock() and kvm_usage_count, but
> doesn't explain why they are related.
> 
> Elaborate comment on kvm_usage_lock to provide more context.
> 
> Signed-off-by: Ackerley Tng <ackerleytng@google.com>
> ---
>  Documentation/virt/kvm/locking.rst | 19 +++++++++++++++++--
>  1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/virt/kvm/locking.rst b/Documentation/virt/kvm/locking.rst
> index 662231e958a07..5564c8b38b9cc 100644
> --- a/Documentation/virt/kvm/locking.rst
> +++ b/Documentation/virt/kvm/locking.rst
> @@ -248,8 +248,23 @@ time it will be set using the Dirty tracking mechanism described above.
>  :Arch:		any
>  :Protects:	- kvm_usage_count
>  		- hardware virtualization enable/disable
> -:Comment:	Exists to allow taking cpus_read_lock() while kvm_usage_count is
> -		protected, which simplifies the virtualization enabling logic.
> +:Comment:       ``kvm_usage_count`` serves to deduplicate hardware
> +    virtualization enabling and disabling requests from different VMs
> +    being created.

kvm_usage_count does that and more, i.e. this is 'wrong" by being incomplete. 

> +
> +    Hardware virtualization enabling/disabling requires taking
> +    ``cpus_read_lock()``.
> +
> +    ``kvm_lock`` used to also protect ``kvm_usage_count``, but other
> +    parts of the Linux kernel holding ``cpus_read_lock()`` need to
> +    call into KVM to ensure that VM state remains consistent with the
> +    host's state. For example, when the CPU frequency changes, KVM is
> +    notified. ``kvmclock_cpufreq_notifier()`` takes ``kvm_lock`` to
> +    iterate ``vm_list``.
> +
> +    To decouple these, use different locks, ``kvm_lock`` for
> +    ``vm_list`` and ``kvm_usage_lock`` for enabling/disabling hardware
> +    virtualization.

I appreciate the effort, but honestly I think this does more harm than good.  I
already know what this code does, and the above confused me more than anything.

>  
>  ``kvm->mn_invalidate_lock``
>  ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> 
> -- 
> 2.54.0.823.g6e5bcc1fc9-goog
> 
