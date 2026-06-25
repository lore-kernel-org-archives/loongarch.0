Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60D8A3164BB
	for <loongarch@lists.linux.dev>; Thu, 25 Jun 2026 18:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782412174; cv=none; b=H7PNVDPBEeBd/r9T4A9fbXexU73yIbOPuZ/IJd9c1HW2UuxBneZhLSIw6o0jl9CGTHL3X4feIZWQgEsHZEnugXlxg5QXJFiYveFEeHvLOIiCKr86+ISjnxi6Gk7n4R38YzNCsGkx1ttn7W2U2anUT9DP24gfMp2QhPsPsPacPP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782412174; c=relaxed/simple;
	bh=ruI1D+60LviHu6T85gvnun6dB5PLGiX7hIRc8JYMsR4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Vunm9ON/hz8CtOkFRABvHN5cnx6mjLFggXnVpBfB8zybqicU0e+rXCpa680NLG1Kf5ugnaDxjpcnFl13ZJ/tNQodo3neU6rXzsf6Boo0JDhYoEExlUtRxacleERma5IaV2lonExdWiLskZ8f9+Id2bPNwAZo3ahBoENElDhBAcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T6bJEq+F; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T6bJEq+F"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2c76be5dd09so1159005ad.3
        for <loongarch@lists.linux.dev>; Thu, 25 Jun 2026 11:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1782412173; x=1783016973; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UlrTxHjS5w8g7dS4TjG06CQGwg1aqavnJRIR747VzMs=;
        b=T6bJEq+FlcuW8uVFQBbsDdFg6cKQK3KZ6lbD/B+qOazTyduW4Btk65XK+F+Xa9wine
         s3XIk34adVi7ate2TjqIHli+sMqF42m/Wb99iBDKY+kibzLPDq2IPSnwftR39DlZyeXR
         YtczBKzxdfpMATIiArA2phluRAscLQZ5Zz/RR87e8QvJ7gIVSOWi21ELCpTiGI7jOuO1
         NEkVjnGMUhYwt7aAqRft1pUgoiNV+KTPUvymcLYUmwWBGiSJpkk4QzAG+kivaaUa8KFY
         6K11sVwuYs1g0R125YJlELNCX+D2a1Uqcs9IZtMAaE6whxBvO3gAtmMyzY8ToSggSlA3
         gFWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782412173; x=1783016973;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UlrTxHjS5w8g7dS4TjG06CQGwg1aqavnJRIR747VzMs=;
        b=ZEKqwK2f5Nnn7CDZJeqhIPv/gr6GRogIH3urtsMl4/vyy10bp0FHH/NZCnhlQkCDQl
         EvMj4wx9sGNjik24q3OpUb3SKBkxpX+BZuq1E//n66YnBz85aipJuRl8QYS/bR3pJolF
         pqD+mfBuUwfGf9Zfv3aSFbDAfWi+YETm68f/t0PflxtfOJzP09giVgSZ/G5KGs8p8pD6
         OTx8+IysWLgF3+2GzV3lVGWNEf7U6D57ARPFF+njVJEkgYbjMdHjOh2B/P3aMV72ipKu
         kMu2I4B9RISv8fmNxFX2Mn1+dZ3CuPs0VSDivQmsRWhUqJuK2/pvamm3chOYT4untl+W
         FkeQ==
X-Forwarded-Encrypted: i=1; AHgh+RosHylZkHwoXXrdJ0yZrumiXz83bnpDeVC6bA/g8WCP1KncMOhb70T7uaQLw7ZW1Or/52t6/Na93Sk=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywh0+VAsMEVs1juZ5ztiFxPHnMsfODD8aypuR+q62ntlVaPC//B
	NlmqXwmoTnuDJSSNnbAeyMeQOtfQZTchyh+4bLASRnXlnIl4sUetsJnkRt+ZJgkBjmEUCf1avDM
	rtO1tgQ==
X-Received: from plps15.prod.google.com ([2002:a17:902:988f:b0:2bd:4f41:fbf4])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d484:b0:2be:3850:297e
 with SMTP id d9443c01a7336-2c7fc792f8emr34372895ad.31.1782412172316; Thu, 25
 Jun 2026 11:29:32 -0700 (PDT)
Date: Thu, 25 Jun 2026 11:29:31 -0700
In-Reply-To: <20260527-kvm-locking-docs-v1-11-4fe8b602ff47@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260527-kvm-locking-docs-v1-0-4fe8b602ff47@google.com> <20260527-kvm-locking-docs-v1-11-4fe8b602ff47@google.com>
Message-ID: <aj1zi1XIvFpJtNlq@google.com>
Subject: Re: [PATCH RFC 11/12] KVM: mmu: Point users of host_pfn_mapping_level()
 to docs
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
> After consolidating documentation for host_pfn_mapping_level() in
> Documentation/virt/kvm/locking.rst, point users of function to docs.

NAK.  I want the "formal" documentation to describe the rules and general mechanisms,
not arch specific implementation details.  It's unfortunate the LoongArch copy+pasted
x86's code, comment and all, but that's a separate problem.
