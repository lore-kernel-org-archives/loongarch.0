Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2C3157493
	for <loongarch@lists.linux.dev>; Thu,  1 Aug 2024 09:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722503026; cv=none; b=vBvqdwBBn4vE7F1i6tP5AT1cCk/p91NDJtOTaV1Ri+OCK/5111JRK0G3hxDooylc+faV5RlYwjzQIx8pecqd+eLp8ytTk2kkx419SaL6fuCiABzKEaEEO78H47+dHETXxzyoBsB/C9SqWqTuJD3f/V/B8wOip9JdVssU6GXXpTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722503026; c=relaxed/simple;
	bh=M/Nhi0sMK7PpCm2r/uuIU8M4tCHIO/lVeQuknqZEy3M=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Fm3E5NL91bdLhAjBBM01rPPjNFdP+b/dOvG6JqODDdUTuBrVAVMWKj4LpOd6SAfHu7DcP9Z3eK5WZjBiH4lb7bYEEOYsezYOkmpFYOom4rd6yMmcjMFcbvjBFLH/E478Fm+4A4vwA4xxlTRsIQfZvEJhuwok/4OBTWgTGo2QAT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZmEewjAD; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZmEewjAD"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a7a8caef11fso776694166b.0
        for <loongarch@lists.linux.dev>; Thu, 01 Aug 2024 02:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722503022; x=1723107822; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M/Nhi0sMK7PpCm2r/uuIU8M4tCHIO/lVeQuknqZEy3M=;
        b=ZmEewjADCcu3KdLu3yApe4e3vWEcgBEQk5tfVVHkWmRuqkD0hdMbs5Nc9/2fEx16ns
         ZLXkrtB69tnrZBMj8rzaDK8iGQn1bmhBdMbQPorKee4fNa8dHsBCMIzFyvAj+/yrWVUb
         uhzWs72LCMIguDHwJghj9xUD3Qd0rpD7s8hpP4/M8e25qXiES/VWZuBpqycpXcanChyC
         QmLSo+eSQYGomE2ykzMwrobJ1aSt8g+z4iqEl6+sxWRbcqis7S0VDHeESnLp/x4Yize7
         xoeo+/r2zM4iKJkrrdtfXAMCPJUG1bYRPxwm1PpvauXgj2Ox23g0Hg1NzYwoRp3ZGf94
         +80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722503022; x=1723107822;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M/Nhi0sMK7PpCm2r/uuIU8M4tCHIO/lVeQuknqZEy3M=;
        b=tRCb6Mpq2DJjBlhELLwrNbHi2bRJ2OdOuECKjjPb9TbYyaROLYo1dIQm7gmuNfw9++
         KuU9J/lIZn7n3ss4ukDCWjBwmaYUX4kKRr3PJyp9SsPj/zSGUPX58yvD5VdbgJ9kt2hP
         uCi/23P4IdxOewmGA4oh3aw3EXEk9Q1HPHDr3hMEQD/HxIq5mBnf/2cQEFzehopKc5v3
         AqhP4i1up0j2aCstBu9lG1PcRgiX5AykhTijw8wXOCU+abCtu5IPA/EhYTwyFxdp7G4A
         RqYmR6ham65DmzdmpY4Z1MstYEAi0rk2Pz/1DgEP0849NKMciQmUX8MEc6bQfYhmNiR1
         ue9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWSx8tmQxx8WTyJmPBs+JNWVctTp/kg086/zqkMW3mhCmOIMTkSAIdpxjDi8JJZaVkktTNHtEwCmIcs4dZxeASGj7EN89ga7Mpg
X-Gm-Message-State: AOJu0Ywq22djqFvvUMgkejcyZpHUcLuSnHm0TuRHIvozcE1r/7r4n6du
	FCuvRxCYs84Fp666fuV4bn5JVbLx3iOqZZ4RrJPt8WysTqoGBNnXi+t7lUgaNCs=
X-Google-Smtp-Source: AGHT+IHhni1Uh+bJITVWfhi2vAVjvXUzKzH/nw0taqtk6cxicA1yt55vq2KJXrilVInru0VfNsUVMQ==
X-Received: by 2002:a17:907:a4c:b0:a77:c199:9d01 with SMTP id a640c23a62f3a-a7daf4c7df7mr132037366b.22.1722503021389;
        Thu, 01 Aug 2024 02:03:41 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acad902e2sm878292566b.146.2024.08.01.02.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 02:03:39 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 36EF35F80C;
	Thu,  1 Aug 2024 10:03:38 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,  Marc Zyngier <maz@kernel.org>,
  Oliver Upton <oliver.upton@linux.dev>,  Tianrui Zhao
 <zhaotianrui@loongson.cn>,  Bibo Mao <maobibo@loongson.cn>,  Huacai Chen
 <chenhuacai@kernel.org>,  Michael Ellerman <mpe@ellerman.id.au>,  Anup
 Patel <anup@brainfault.org>,  Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou <aou@eecs.berkeley.edu>,
  Christian Borntraeger <borntraeger@linux.ibm.com>,  Janosch Frank
 <frankja@linux.ibm.com>,  Claudio Imbrenda <imbrenda@linux.ibm.com>,
  kvm@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  kvmarm@lists.linux.dev,  loongarch@lists.linux.dev,
  linux-mips@vger.kernel.org,  linuxppc-dev@lists.ozlabs.org,
  kvm-riscv@lists.infradead.org,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org,  David Matlack <dmatlack@google.com>,
  David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v12 04/84] KVM: Allow calling
 kvm_release_page_{clean,dirty}() on a NULL page pointer
In-Reply-To: <20240726235234.228822-5-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:13 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-5-seanjc@google.com>
Date: Thu, 01 Aug 2024 10:03:38 +0100
Message-ID: <871q38fwd1.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sean Christopherson <seanjc@google.com> writes:

> Allow passing a NULL @page to kvm_release_page_{clean,dirty}(), there's no
> tangible benefit to forcing the callers to pre-check @page, and it ends up
> generating a lot of duplicate boilerplate code.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
