Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149B73126CA
	for <loongarch@lists.linux.dev>; Thu, 25 Jun 2026 18:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782412640; cv=none; b=iQurjZOArS2q6DatqK0DnZxVk9hJdvITx8mCaNWh8vfLBCF/8lBfGfZmDMsnjWy0QTIqu3i4x1NMMan7h+AClxmMZI/xye19RjMCS43pN3vuc3lRw7jiQ49Ak/KLieZriFcaRNmcMfWiosGWHmaxhz00DxVMJjgv1YFaG6Z7P7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782412640; c=relaxed/simple;
	bh=XGF2VYl68rxHrrb3+celOOH/NDrS3MYyMHWdfsQBzvU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TLjiWuzRyWqTrTgQNIkMo6jaO10aMV2SE8Ct0NQMU9ozR8q6TbYmrqS+VjxXplk0IJBqJgVvkAFUAiuC8H3OoewOtkmrUIOqaN2IZBXdxnAMS/t9G3aWiU3No3j02PJV1phy02BEA2mwwMsi/paPCjKrqcisnfqy9R9XFz3+al8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wG3hadfl; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wG3hadfl"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c8bad49b171so78433a12.3
        for <loongarch@lists.linux.dev>; Thu, 25 Jun 2026 11:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782412638; x=1783017438; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=k1CLBFjHRtepPsR7OTGTpvVtcvQrDt/pUW+o4gNlp90=;
        b=wG3hadflOeQwYHUWcCNz613sQp1rKvPMPZzK13pBJvyhQwvHqWuY8ygFIdPMGr3EYk
         Jy3/s2CYqhWTO2koyRkgJbBUyMJbfOfn03CGdFACuVRs1W9jblb1iwX9V0zjyG4nXLgc
         r2HLz+29D4jIUhYeg50nNzYX1f76jLKsHxAr2WsGMJoJGjUBfU3TJoS1RKIvBCtvjs96
         3ZmeymOuc9/st1YJp9XCw6x0onmXG//6rIqrfOvCjLk92J+COuhU6iDsS6SVfyHxH897
         SYs8hbU7WqtRCx7PWiGVDboQ7gM40gmkKmrUzWOwQLaXVJUVv+6+rDZyodd0BEb1hI6p
         BLig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782412638; x=1783017438;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k1CLBFjHRtepPsR7OTGTpvVtcvQrDt/pUW+o4gNlp90=;
        b=daILVcu1na/gw3lon/Q4OPK7QlyJnHY3WLfZjzKvLfEzZA9iDqK6EKrc0pEiZ9k1Kn
         2Wgfc0eh/C9FJo4oJILecNwzXNmoaEbF159uy1GO6Y6b517geEM26RvrYYTyzMxjKvUv
         Pub6h4UftqsR4CMo3kQOv3N+QNarXDojToFx5Fn4qEsVj3n6jaRIOyRQyQf/SkV4evjl
         D2yvFU1967RuBwzRbII/85jTTSrLDRxUiAv1HCa2rfu7YtjSfA4IPwkVb4xg9kooM3BA
         uxJNkr3QXWYs5+2vXuL8GcKShxglO3pvJpGscQz03Ewjzc4vN9cvbbS3IGt9BO0VNu6H
         FouQ==
X-Forwarded-Encrypted: i=1; AFNElJ8YUhLC/Xlb1Pf9WZ/s8uLWlKXpgTJUeJqpS8kRFEKWOTzmc2h2z2FwsdXCV6+iD2gfsb5aFxlwcYk=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywws8zJhwFq9+79g05QsP9TTvLumhxDadfyygtsBoCB2P9FVQQu
	RUy84Xdo68B0DnyogAmExFgFXwqAlzcl/hkqtH0XL83JBWk3hSy15ECYI8uX+kcf0sgtqk4eknM
	SvIzNFA==
X-Received: from pgab3.prod.google.com ([2002:a63:3403:0:b0:c89:356d:606a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6b04:b0:3b4:8aad:6337
 with SMTP id adf61e73a8af0-3bd4ac80c24mr4406701637.15.1782412638064; Thu, 25
 Jun 2026 11:37:18 -0700 (PDT)
Date: Thu, 25 Jun 2026 11:37:17 -0700
In-Reply-To: <20260527-kvm-locking-docs-v1-0-4fe8b602ff47@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260527-kvm-locking-docs-v1-0-4fe8b602ff47@google.com>
Message-ID: <aj11XdftC_WAf6Av@google.com>
Subject: Re: [PATCH RFC 00/12] Document synchronization used in managing guest faults
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
> Ackerley Tng (12):
>       Documentation: KVM: Elaborate comment on kvm_usage_lock
>       Documentation: KVM: Consolidate notes about cpu_read_lock() and kvm_lock
>       Documentation: KVM: Consolidate notes about kvm->slots_lock and irq_lock
>       Documentation: KVM: Turn - into bullet point
>       Documentation: KVM: Explain what rule the exception section is meant for
>       Documentation: KVM: Have actual headings for exceptions
>       Documentation: KVM: Drop mention of kvm->lock in SRCU documentation
>       Documentation: KVM: Add example for kvm->srcu in relation to mutex/lock
>       Documentation: KVM: Document synchronization for managing guest faults
>       KVM: guest_memfd: Clarify comment about gmem.file vs kvm->srcu
>       KVM: mmu: Point users of host_pfn_mapping_level() to docs
>       Documentation: KVM: Focus acquisition order section on preventing deadlocks

Please split these up into standalone patches or small series of patches that are
logically related at a finer granularity.  "Here's a pile of KVM documentation
updates" is not a reasonable level of granularity.
