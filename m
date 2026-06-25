Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAAB2E7F20
	for <loongarch@lists.linux.dev>; Thu, 25 Jun 2026 18:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782411439; cv=none; b=CL5O9wMvj6KEr4TbUHW1Blb6wwx4ko3YZHECMJ6j3Gro9AtGPb1JzT9xv/60MTvaI2qBtq+HdWBg1MP2Ri4QpEyh0JT8RhB1qYIehIvHTazsSroAJFE8PCGasHGxcyz0+ZplohD9uINymNfS2ZPnVPWssRb6Jx5jiV36N6Nv/XI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782411439; c=relaxed/simple;
	bh=vKWkUzz4X0bpy1wS1bHDH15EShZ57erHcsR8b8E2gsw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ax2fLfa1yqPHIU6l1YsMSz0FdXL5eTIbdTDFpwZCJdo7GhKnNeIyxX3yL7ExhtkqKgGEqzTJmh2Gq5LmSHKx7A7BKf4TQmO/yMwhOcBzhRP67uLBp4+TsjGoZflID3AjEwD4swZEIo6M9LJ4HOeANvnawbro7joh00QEtWCr2Rg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sq29NXTV; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sq29NXTV"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-36d97a4e08fso94539a91.0
        for <loongarch@lists.linux.dev>; Thu, 25 Jun 2026 11:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782411437; x=1783016237; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cYqoCrzIGCmqpOtcxPfNb8nePoxNc13ha9iTOF4jwXs=;
        b=sq29NXTVRwd3BWOms6d+a8OZb6oESub0ZJKr+7ed6a/NPgfGYEPADnU4vDPA5rMj1d
         mj1Wr4TywuBWY53zpGlWPrb4iCxXjPrIhixLXdvcwTl7HBEX+3UQJxYFTpal52Wdi82C
         iOg26BgquzY7/ql69uM39TJa3jt7obwzgACY5phe1AOjdYCJ72eRNFrpZ/xJ4P4nxbKt
         olent1zQbFFd+as9C5Xi231LOkNq8YVwTwxAhoNyrndEMt5S79ZSKBWN4Vih/pgbjkos
         ZDFxBmerecNbXGPk2usYAvCcmp8pzzlBVX/2vsL6wWlGvTbzmugBPFd6PSDFrFRJ8Tkb
         MtgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782411437; x=1783016237;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cYqoCrzIGCmqpOtcxPfNb8nePoxNc13ha9iTOF4jwXs=;
        b=sy3KMpPpzgELGMtrBxkmPiN2yadxv53Ev8m6OX5hBL3kgF0ctE7RjDT8AYwbABcYss
         Fin0YRdsxDWW4Z+OZUuLAhqjYOwuraljM6oeM+zy5aclrXgaf1c6hBKSuzhVSN5beOpO
         Lqzb4LrUOzpAhrUzwB5cjTKQwbDJlt7ODZTB6BrjiT5TB4PYenicgWDK6/060u5B0pgc
         HCLq80SaKK/ypgTjrl4FLIs6mbMYbly11UGqEsbFhvfVSMcFp90y8Q5N0CpuunHTjsFx
         Jcah1OsNQyZ2eIkBiIeBbhIP9dkZJMMiiZwU/YBm3X3OUTuF9rnxeHHwIW5swXAH1MCw
         2uAw==
X-Forwarded-Encrypted: i=1; AHgh+RpHt4AaLo3kwTshdGEjWsQhKODmklkhUuNjLPnwpoBFKrPK0Hl3EhB55lZp+gwPy84wU7K75a5zgL8=@lists.linux.dev
X-Gm-Message-State: AOJu0YznqKU5GO44z7w5q9/jjgZavd5J8AaATEoINSdQduVTwBIe1ffd
	rKId9dr9yA1kA0yGxZtVIl2BEXYLU2vwfNHRHEqgdMHFuWaGShivEnHNVnTzWv6BQGStFskjw86
	pSXKihg==
X-Received: from pjblx10.prod.google.com ([2002:a17:90b:4b0a:b0:37d:8022:9ef5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5108:b0:36c:e254:4db
 with SMTP id 98e67ed59e1d1-37df9f646f7mr3203405a91.6.1782411436892; Thu, 25
 Jun 2026 11:17:16 -0700 (PDT)
Date: Thu, 25 Jun 2026 11:17:16 -0700
In-Reply-To: <20260527-kvm-locking-docs-v1-8-4fe8b602ff47@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260527-kvm-locking-docs-v1-0-4fe8b602ff47@google.com> <20260527-kvm-locking-docs-v1-8-4fe8b602ff47@google.com>
Message-ID: <aj1wrF93FLkTNRJQ@google.com>
Subject: Re: [PATCH RFC 08/12] Documentation: KVM: Add example for kvm->srcu
 in relation to mutex/lock
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
> Add example of where vcpu->mutex and kvm->slots_lock are held while calling
> synchronize_srcu(&kvm->srcu) to concretely show where the synchronization
> primitives overlap.

Sorry, but NAK.  This is too x86-centric, and IMO the risk of the documentation
becoming stale and confusing outweighs any benefits from providing an incomplete
example.  Because like the kvm_usage_count stuff, I know the code in question,
and the example confused me and makes it harder to understand the rule(s).
