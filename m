Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7067B3D3
	for <loongarch@lists.linux.dev>; Tue, 12 Dec 2023 17:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m8masJf1"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-db548f8dae4so6062660276.3
        for <loongarch@lists.linux.dev>; Tue, 12 Dec 2023 09:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702401496; x=1703006296; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AYZqQZ0C1vTq1Q5ZgORnfs0Fnsc+4+uug2eKsahCD6s=;
        b=m8masJf1EodW4QFnJZ8Pf350F6WInHZpHnN4dbvwmf8W+GzvxTu4p3NIdZYws5FJAQ
         rbNfcVr4ZfXgccRNKfuQUWzEPNVyTsEpH050p888GJze5KhonmOr/e+2P4Ko+6+g0ggu
         9nUp27kbyBrh791M1JyCs50icRQRyVBT9Yk5QQ2/NU1uY7g/8DisZtvwz8gIRPP+Goif
         Yx1K8luGtAMGHm17ZWXYEQfregY/czp31NaYxUbmDg/Rv6QqTgRCuy479lAPzrKEMEXu
         MJCFKYwpRCKS8U4NoJRRD4+DpVmEbFMRdwopgZB56LnfHcraZRZ+l6Lxcdba1P/U9k79
         wRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702401496; x=1703006296;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=AYZqQZ0C1vTq1Q5ZgORnfs0Fnsc+4+uug2eKsahCD6s=;
        b=Xvs0yrNwRZva1lh3+eHaBKbHHt4DTYj/Ij0gFjj3LujcXYHfG8NptApcraK4Xl6S+c
         jc0yNUwlVpraikaC7sCkRDSkUcEwz7rs/K6aqI4ROl3go7hX1SA89fkVVP0pXovQ13gU
         1HmCqTAOtYh5Bq51F5juB3xVjBC1d2jMyxaH2HHQxEbibH9bu6VWCCS4DvXKJtVOKxuv
         nG0U+hLiAJuF9SItNI9pRfnzwWnyHIhQJf3/m3vS1G/Fb6mNWEQiN1YqQoB2UyVPOUlA
         oZ6rgt2o0n9gvS2Ey4Rcsv/evnPyfNQRm0PspaOtQlv7PHznPjrDh30wJAdoLKgEVx+A
         /psA==
X-Gm-Message-State: AOJu0YwgRtaJHyoUpYArniyhiW4zYFVOQX4ZxaOEbZRFSV3m7c/YAHPS
	WOKk0ZfPf/vKxmYNUvmLR1dACRqCMIw=
X-Google-Smtp-Source: AGHT+IECIs8G3jM2WZyRE4oWJhjBQvPB3/u39KEvPcuAITAWFWLvSUfQ0hYgQ8mlsjkrjvzsZAZLs8GXAU0=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:150:b0:da0:3da9:ce08 with SMTP id
 p16-20020a056902015000b00da03da9ce08mr64114ybh.10.1702401495879; Tue, 12 Dec
 2023 09:18:15 -0800 (PST)
Date: Tue, 12 Dec 2023 09:18:14 -0800
In-Reply-To: <e40d3884-bf39-8286-627f-e0ce7dacfcbe@loongson.cn>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20231130111804.2227570-1-zhaotianrui@loongson.cn>
 <20231130111804.2227570-2-zhaotianrui@loongson.cn> <e40d3884-bf39-8286-627f-e0ce7dacfcbe@loongson.cn>
Message-ID: <ZXiV1rMrXY0hNgvZ@google.com>
Subject: Re: [PATCH v5 1/4] KVM: selftests: Add KVM selftests header files for LoongArch
From: Sean Christopherson <seanjc@google.com>
To: zhaotianrui <zhaotianrui@loongson.cn>
Cc: Shuah Khan <shuah@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, linux-kernel@vger.kernel.org, 
	kvm@vger.kernel.org, Vishal Annapurve <vannapurve@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, loongarch@lists.linux.dev, 
	Peter Xu <peterx@redhat.com>, Vipin Sharma <vipinsh@google.com>, maobibo@loongson.cn
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 12, 2023, zhaotianrui wrote:
> Hi, Sean:
>=20
> I want to change the definition of=C2=A0 DEFAULT_GUEST_TEST_MEM in the co=
mmon
> file "memstress.h", like this:
>=20
>  /* Default guest test virtual memory offset */
> +#ifndef DEFAULT_GUEST_TEST_MEM
>  #define DEFAULT_GUEST_TEST_MEM		0xc0000000
> +#endif
>=20
> As this address should be re-defined in LoongArch headers.

Why?  E.g. is 0xc0000000 unconditionally reserved, not guaranteed to be val=
id,
something else?

> So, do you have any suggesstion?

Hmm, I think ideally kvm_util_base.h would define a range of memory that ca=
n be
used by tests for arbitrary data.  Multiple tests use 0xc0000000, which is =
not
entirely arbitrary, i.e. it doesn't _need_ to be 0xc0000000, but 0xc0000000=
 is
convenient because it's 32-bit addressable and doesn't overlap reserved are=
as in
other architectures.
