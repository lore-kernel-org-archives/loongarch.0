Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CF216FF48
	for <loongarch@lists.linux.dev>; Thu,  1 Aug 2024 09:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722506140; cv=none; b=SV3uptJsJRW+XyQU2MOZWPdNFBNy1f9ZZgQ9LmDwJxU5eGk04li4ru85Vb/vHuhS4ra/rOKktqdYoLsTwuuFuq8uh+zfEb3wKyqb72xpVO/w2D2HemLT9zKaqW8hSVeYTUaCe/DJ6kGdGnpiKQdaXf7RxEL4UfgK7HnLwvDWbbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722506140; c=relaxed/simple;
	bh=CfWoHfDxpbd/BrLn4R6OTlWdsgX7K0q/kTBzQqeOmF4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=nR7hg6fNy/kkQNxuATkXYRIz4oBZy+lVrhjqK9gq93iieLvVkPvoklquDyTLsn6egndvneftH+8ssGsheXRloaA4xLdluwUePnx9MBBGUAfONMkj4pr5EF5DFtsKikBPWFANXsQ/eMoRtLRdwcG8naVFGhdtTviJNPNCzZA0/eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MNdz8peN; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MNdz8peN"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5a2ffc34677so9743907a12.2
        for <loongarch@lists.linux.dev>; Thu, 01 Aug 2024 02:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722506136; x=1723110936; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CfWoHfDxpbd/BrLn4R6OTlWdsgX7K0q/kTBzQqeOmF4=;
        b=MNdz8peN6KtrqBOQwl6xXah3O52uqJETLTuIhe8Yqe0IbAswEVgAZvgsmdRTJx6kg6
         gL8Hq+5n03pihPla6+En3ARVm7/4ycB0G3wzhcoX/fhq5bv8vf5EwaWHT8I0oXS5Xfqg
         sAnFbZcW+g0QJPccVFoliIvosDHib60KYMik75S/j7LgCnfZNQngFB087Yphxdmau1bd
         B+9NLsL3ZnQZ+bSuEAItna6freS92E+l5pZO1CiYu19vgrP0S8qCPxzud3pWEgKXd6TK
         POcJBHnvgTyUAJBhaUkgIkryxvyRF1OHLQ3z/IvizIllIrHvHgWZMUmUhnrt4KqWnQJJ
         mpJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722506136; x=1723110936;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CfWoHfDxpbd/BrLn4R6OTlWdsgX7K0q/kTBzQqeOmF4=;
        b=dDoeD9xAA+WepNkqnCprcCNKRkwDiZZvsNJA1S5vWi/zEw8QAvdPMOP/DnBuEsM1UJ
         vVGUjipSJ06X3UxhNaK8ypKjHO47FaG3eE6kbHzfXJGKJIL79LOnrrUDXOnbtfFO7ImN
         FOrV3ASBRpZjwUckzB1jU85Ob9mNIwYr11XJjxDqmEoccfW+HsSgk+0cpkPuQviGFgaV
         Brh+5JuJOSBy6W1IrZjpRfwYxrl9aEZykd2NCw+R5uVC3mJ9aFRjQsWpm56x+pzzaJut
         iA7AG23h8CNrk9JmSsDphrzmkWx9FBj4UQhX3E/ssROPM8vhFsbkOgsc5FqpQ/WUt+4h
         AGXw==
X-Forwarded-Encrypted: i=1; AJvYcCUHA6dgESfRq4wgKdKLwL68YwEZ9X1ylfxi8Jg1dSaEqabch+Rr+HEcYDoB5FC4wKTZGvB7kfHxozZdr279jvwaV2YCSJ2ANG5W
X-Gm-Message-State: AOJu0Yyo2jRkDKMNqzARCeyorsW6YHti/PZFvMT6okPtsyZ6IKgXDa6R
	iNE5hdGnCy2mywqKKAA94r3phhAMpUTSjXsKTSh4YGb1aAJirEf8oyrzil7/nW0=
X-Google-Smtp-Source: AGHT+IGb/nSGVf7NWCnHjhhrhlGi5SRtFpH69is58qT222M0oYGxJthjaOlCxTOcuwDzU1FyViVsdw==
X-Received: by 2002:a05:6402:b32:b0:5a3:5218:5d80 with SMTP id 4fb4d7f45d1cf-5b6ff4e0399mr1182829a12.21.1722506135641;
        Thu, 01 Aug 2024 02:55:35 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5ac6377d005sm9858902a12.38.2024.08.01.02.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 02:55:33 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 2329A5F80C;
	Thu,  1 Aug 2024 10:55:32 +0100 (BST)
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
Subject: Re: [PATCH v12 26/84] KVM: Move
 kvm_{set,release}_page_{clean,dirty}() helpers up in kvm_main.c
In-Reply-To: <20240726235234.228822-27-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:35 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-27-seanjc@google.com>
Date: Thu, 01 Aug 2024 10:55:32 +0100
Message-ID: <87h6c4efe3.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sean Christopherson <seanjc@google.com> writes:

> Hoist the kvm_{set,release}_page_{clean,dirty}() APIs further up in
> kvm_main.c so that they can be used by the kvm_follow_pfn family of APIs.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
