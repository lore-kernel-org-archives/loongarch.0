Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50C7116EB6E
	for <loongarch@lists.linux.dev>; Thu,  1 Aug 2024 08:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722502652; cv=none; b=t76WUZY1So+O/1c46v4XhkO6HnyyKAkEvWXWtKQxe27Yfi+LoPCiMYvEc2CRod126vtyW5J7Edudrk7Ux9i3qslX/XY6MOLFXRMVRMRtd9NWeUgO41+NkSpzqofPYk+6d4yeydCOMF5Ipu3DbR/qiHvSvQWzl43b/AsWC23aLL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722502652; c=relaxed/simple;
	bh=JtRBSdBvaqBsQtNVvhstlkMyWmalBV9Q7J8Cb3IfAjw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Uwnf2sYySwPTiOqhgoHZfeFh1aTe5pbiJ4fXMe2md9nd46Dqg6HXOPhqg3rwgvya/1dNC+k/9uhcpl/y4GXneh8KKehNurDWYFxKtQCK3x2jrkNfE4svjlIYa1pNMrr3QiDNFqCPo+AniP/shThYVpef5m0mIyMRf3RbE1x+J2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ct4JDeIz; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ct4JDeIz"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a7abf92f57bso876554366b.2
        for <loongarch@lists.linux.dev>; Thu, 01 Aug 2024 01:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722502649; x=1723107449; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Syi3zSlJ8k1vqxBzUq6nZD+avtMgHQU+/NZ7B5gDmQ4=;
        b=Ct4JDeIz4tVP3G/9jQ1ptBJDTjvm9PS6RW5+2wwMMCvSNfXFUxv+AgckDgulghchrU
         YkpcFc2f673T8XS7JnAFeASh/QBWaHdzJ379tYMnbKzpMDQJwQlS6PAG6pBAciqnoKux
         dljzbHkGZ+zLGT4N/LO62MH7to0l6UYQRX7fA2M/42lDde2lxFkf1cbVW1pTHFNZiQWp
         9/Ku2F2KvodppdeTmr6SyZWvoIa1+pksqyCak4RLw0cGyLGyNw5PO/BCVFO+HnfrtMts
         7WC2vpfwJr/1pe6TQ4FdTvKzjWTL3Mwp0HeDY+EoQBB12PMzhd3qDALkBd7mt8UEjTnX
         tt2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722502649; x=1723107449;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Syi3zSlJ8k1vqxBzUq6nZD+avtMgHQU+/NZ7B5gDmQ4=;
        b=KCoJob3TtuvMEOsxBfjlpw4b4LyFrN5SnrKEvD2YmXRlhb8rBKkR2/7uEXqOikaRNw
         VdqtQOMnH3cJX1g6JRE7wbX1+hEYG4KmbPR7vC4mSt4nib+P/GuhBrLokSNO7OuMeRQT
         iJlAcIDDcGFhCCIpsAkulG8t3sQyh8psLzzci4Lp59GKqjZwvXspVS8UAR8UOPwp+Pk5
         8NlVDplkkB2qxljUEzFaknF8bEXbm8LfhSp2p+RCTj67MYh2CNzbDv5Xx43TEQFly+jE
         rrlawnvFeCbhaFcvZmj3L/+sH0eyjPbMFPWYtkh8T1gC0tZKN07ukBp1SP3KISgZGrmU
         3mVg==
X-Forwarded-Encrypted: i=1; AJvYcCWb7H/8GRh+WjckySyFCW1ee6Fxqx7vQSyLIeW98HvGBU2Z90Z5fUZIg6YlLb+kLKwBhnVeVUz63ceRY+uMusuZAZOyXVhc9i22
X-Gm-Message-State: AOJu0Yyg2jLnEo9+Ba+qBbmcXzTe/3AQ7C1xigqELRBhTGGOEg/9hgKv
	fV5MPO5P7H2Hk52h+EmSy34shm/7ZoXCzjM+YdXxWcfTKQzp82fbpYrpSvW6sKg=
X-Google-Smtp-Source: AGHT+IEdS3NM6t6Y7T/95sEL4C7ubpn/6F0Cu3mCtANczyd9mmWSLE4tcyyhWaOoIZKPq4CsXdarWQ==
X-Received: by 2002:a17:907:6d0e:b0:a75:1069:5b94 with SMTP id a640c23a62f3a-a7daf535320mr136914966b.21.1722502647807;
        Thu, 01 Aug 2024 01:57:27 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acadb82d5sm865337466b.199.2024.08.01.01.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 01:57:27 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 3FE7E5F80C;
	Thu,  1 Aug 2024 09:57:26 +0100 (BST)
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
Subject: Re: [PATCH v12 03/84] KVM: Drop KVM_ERR_PTR_BAD_PAGE and instead
 return NULL to indicate an error
In-Reply-To: <20240726235234.228822-4-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:12 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-4-seanjc@google.com>
Date: Thu, 01 Aug 2024 09:57:26 +0100
Message-ID: <875xskfwnd.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sean Christopherson <seanjc@google.com> writes:

> Remove KVM_ERR_PTR_BAD_PAGE and instead return NULL, as "bad page" is just
> a leftover bit of weirdness from days of old when KVM stuffed a "bad" page
> into the guest instead of actually handling missing pages.  See commit
> cea7bb21280e ("KVM: MMU: Make gfn_to_page() always safe").
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
