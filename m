Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E7F3126CA
	for <loongarch@lists.linux.dev>; Thu, 25 Jun 2026 18:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782412537; cv=none; b=cY3XQPfqe13lSLdjFogudxqxu3wQro48gq1LDRUU0WWCSAUR9fEBjjBJQghq4SA5szXaNLUReuqLqMkn0cjrZXqZlowRJFdjFf+97bMhxMVHeMB6F0APMUaCt7VJaZcaGpyJ3HHhpmvEwmLTKXptOxsp+jG1MlNIpN8kVjSdFTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782412537; c=relaxed/simple;
	bh=L9vCpaeeEmhW+X3fHblf6tQERv8UAVK3udM+8P3RNr0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MLhRU16dXREBPiAGleemBI4DrYvwUMfKUUjnHYIrM1YuIkurZcDCwLejA1CVWv7QPlDqjshtYP/+JyhfaAMY7EnBzbDKRbCBfO+O729MiGJ3/oVpW4OlJp5sQkO33MUQS8YReTXx4WNBuLsn9EzL4hFKSGOeIeprTPFPPhUrZoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qTDe6+Zh; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qTDe6+Zh"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2bd04e4fe3dso2799945ad.3
        for <loongarch@lists.linux.dev>; Thu, 25 Jun 2026 11:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782412536; x=1783017336; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UXrEPlz9Ov6WhImX2KAHJf2Hbzd09EWe17YltKaKh6c=;
        b=qTDe6+ZhX3gPzcCcERKeOQ/KWaf/D+h1hUfS9NRz+EvWbZTGPwcHk0lUo8GuShHja3
         3X+kBi9jRqaMkvew5TWtq8sSGP8HpQ2zl9NDgwpOMu0oy6Smrir9BXG45iwwUqJ2d99W
         aZ3tUynJi6DR6qstNpDHsS2qSYkpkhPvR5YibbHDBYEg5bqp4vxWRNdbW39mdrbdlALB
         wXFwvUirsFfltr7o4t6m73mlH52NugmlYGL8qZRMPiebUiIhjXnya2iRrCF1h0RwsnHk
         Z/gbfJzYWBZOIlKEZnv6Ba9byccVGkr/1zy7eWv4wHDqjZK7v+Cs4Uoe33Qk9dfgzFLx
         kdww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782412536; x=1783017336;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UXrEPlz9Ov6WhImX2KAHJf2Hbzd09EWe17YltKaKh6c=;
        b=FwIZeBLBelWnxyEC64N93HCxhNGJqW3V3vv1hda9GIpyZS5qqqmBmA9T7fXxmCm78C
         ZwupmsdSoOz2QjiP8o0hu6Ds1pr8C8iNi/V5PHb/OkwTMZLhDnhUZ9PQbmD12cq79DYu
         JavKvZlNdKkT2KbQJDPx0cWTzFDZX+ESx5efyAPwU+AgszXto17XJ4DU8VxRPw9WrjRt
         XdbQcyhRjAdTCj2dArJTLHnXgEVm9zGISLrJJExuGY01M89lAOi2MXLuR0mQmt4ovVK+
         CUhBFo59pRVTZVkV1BqvPmTZFB5dxGmeLulwbx1a5I7hfa5E/BxyzqAFtg+nDgzffbni
         kOAg==
X-Forwarded-Encrypted: i=1; AFNElJ/ByInh/2MadG4HmS1c8tRR57repf9X0BkEIGjf/WOKITV3Yhr0Ae35aulFGTcm4ix68UdeqLbVmg0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwmWP55wi98czqSyNUAfc6NIrEWJo/AKclMtf/lbVaROIT+Bx91
	2EBz3mYNaJo6g3U0I2pS/HI/XD/QAg76XrH7a/ARnq9JE9ZOS5sB9wyx4OaeNxql7FR4ZdQrq+O
	63ua7OA==
X-Received: from pgbz5.prod.google.com ([2002:a63:6505:0:b0:c8b:dff5:ac27])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:a11b:b0:398:7256:3c0
 with SMTP id adf61e73a8af0-3bd4ac9e542mr4363119637.13.1782412535530; Thu, 25
 Jun 2026 11:35:35 -0700 (PDT)
Date: Thu, 25 Jun 2026 11:35:34 -0700
In-Reply-To: <20260527-kvm-locking-docs-v1-7-4fe8b602ff47@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260527-kvm-locking-docs-v1-0-4fe8b602ff47@google.com> <20260527-kvm-locking-docs-v1-7-4fe8b602ff47@google.com>
Message-ID: <aj109naG1wr46Cpf@google.com>
Subject: Re: [PATCH RFC 07/12] Documentation: KVM: Drop mention of kvm->lock
 in SRCU documentation
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
> The original comment says that synchronize_srcu(&kvm->srcu) is called
> inside critical sections for kvm->lock, vcpu->mutex and
> kvm->slots_lock. Drop mention of kvm->lock since this is no longer true.

I would *much* rather "fix" this by saying synchronize_srcu() *may* be called
inside blah blah blah.  Because (a) I don't feel like auditing all of KVM to see
if the above is true, (b) KVM's implementation may change again in the future,
and (c) taking kvm->lock inside a kvm->srcu read-side critical section is still
unsafe as we'd end up with ABBA deadlock (well, ABCCA?).

  1. SRCU held, waiting on kvm->lock
  2. kvm->lock held, waiting on vcpu->mutex
  3. vcpu->mutex held, waiting on synchronize_srcu()
