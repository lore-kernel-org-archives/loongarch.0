Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8D0DF59
	for <loongarch@lists.linux.dev>; Thu, 25 Jun 2026 18:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782411138; cv=none; b=Wkc4bmntNWPbkd1XnRTXa/3Y95/oq0gjkuVuiKiYdeQCJD766AHDxPF0i71kXz4msxxwaaaXxDoren9Z8hclw/pazNuYkZQRigWoAl0ez+5yGAalgnwfHkcsBxmJkDlQ+oUCyLl/3eLs1p+KvLqNTQ7BWo9PrENmKWlfLVA9w84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782411138; c=relaxed/simple;
	bh=yjS5dSFpPH1rBFGssmlHMMVeXCrnNZvGHXjHEcEI96E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=u9prcT+sCWO0xETXvd33jMbASfFoc66qJbQ6MkwtuJmHysYSn0WmxpUJ4LY1Qp2b7Fzj9tzH561s/eHBAPoRZFTXapTRZgIbZqduP0h+SltdLsnQ2zxKwqYM8pIklQhD2MdWUP4tElvsHb0QfzHMVhpf+BxjIbywV6DvlrSlt7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=liZqOHGI; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="liZqOHGI"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c6a20348ceso1417595ad.1
        for <loongarch@lists.linux.dev>; Thu, 25 Jun 2026 11:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782411137; x=1783015937; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yjS5dSFpPH1rBFGssmlHMMVeXCrnNZvGHXjHEcEI96E=;
        b=liZqOHGIOwvxCu0yKTOP53oeuZRAMAVPKcxPbbnacSrXjxlqRHzFAcaI/1RvYV5DGu
         QSOEEwOg815cQbF69F318eyUIcpnN4i46rf/uIpYvpYReYLDLVHyT4w5QM5N8BMm1yGk
         DT04mmuIVGa4VwA1mIfM0+joGF6ts6wWDcNdt3bTUZ/UUEJlmjdRNBIWdhw96RSF+fDZ
         wDKxB98xLJPRojoFdd4QCP9QewItNL4ujDS11aWeVNELJz+BwnZpshIrb9hzAY/StI5s
         2su53a9fiLSA1709yPCDTaSikExRt3+iKpHYC6b03N5JEgt5IrmpCG/qUtNUjsRWxrcj
         sarQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782411137; x=1783015937;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yjS5dSFpPH1rBFGssmlHMMVeXCrnNZvGHXjHEcEI96E=;
        b=Ywk76kuQohO5dxOhVtyk+6mLGInC8ynp+XqqpnqE1mqI7mM2tuXukX+ymU2pregQPE
         wyLZIhwmq4yY6kYJb2WOKit+4/rP0uhUr4me5yqI5Uc9rACfXWFsexWUqMSpydSjwKEK
         bK0dKmCVTC6fnw5WG86ZtaMeAVBSj+/EkP6OgGJBePgsBYDbqjkl9VL4DaXHlCc+crkd
         Ho92gNCwfggqyiCNaiA9l/F+iEceVqGuapSLWj1ycSoRgktQEDVVODQvMpCrPPtCVEiL
         NDJR0CxGMtAcJeBJmDP+eFQBvdsXswjmwl7tyhd+Z3D2bVKCO1lnUP7qP83jOt2DjbBF
         dtDA==
X-Forwarded-Encrypted: i=1; AHgh+RouqdGn1EKfAyPK9QAOHuuB7pM5xueyRhogPFOnFjVVnjAMO07OGxzGZrtVgw2BC2giKs/b1K14wy4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyskEayz8DhaXbvHqpKCGHww9uXd4UM+DqGzEvbg1cjWtnO5fsB
	usJS5YerZY6f8JeBPmVslEOuLj46KCw5XliBqBiBDFVMm3fYCNft0EB0FZ/6j3UpgJIdNKm6Kbu
	MUKFRSw==
X-Received: from plht13.prod.google.com ([2002:a17:903:2f0d:b0:2bf:17b5:30c9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ea07:b0:2bf:2369:a131
 with SMTP id d9443c01a7336-2c7fca0df92mr40937135ad.34.1782411136519; Thu, 25
 Jun 2026 11:12:16 -0700 (PDT)
Date: Thu, 25 Jun 2026 11:12:15 -0700
In-Reply-To: <20260527-kvm-locking-docs-v1-2-4fe8b602ff47@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260527-kvm-locking-docs-v1-0-4fe8b602ff47@google.com> <20260527-kvm-locking-docs-v1-2-4fe8b602ff47@google.com>
Message-ID: <aj1vf7HXJXvHi20f@google.com>
Subject: Re: [PATCH RFC 02/12] Documentation: KVM: Consolidate notes about
 cpu_read_lock() and kvm_lock
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
> Move the detail about cpu_read_lock() and kvm_lock to where the acquisition
> order is mentioned.

Why?
