Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1818116FF48
	for <loongarch@lists.linux.dev>; Thu,  1 Aug 2024 09:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722506032; cv=none; b=r0xVGbaMg1BW4gUXJEMKhKCzapxow1O3dn4EVcENFZqvBGhLjlJ87unucPnhRXk+fOfsN1aaDjoWtp/DBgBw44iAXn9vzd0t1LT78QM2y8SxCnfi0qVx1zf8g2glpiCXR50OvFH4J0mYjLLZmnS/vYN4H/HSGn22WVjtgyOPirU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722506032; c=relaxed/simple;
	bh=RZpvv9TExV/YqUUjMHmoW7U1MADjmJXiZRuzMf5dgoY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DvptcB3h2tzaVpcKEIHjm08Vqt0TcxT4u+34Za4boPv5cCs4tA4hftGo4vaGGSD4uD5uQ8oYa5KHvAIMuob3Zxk5AP/D39pmGiDDJJzaNjF6R9YLAAaAoDbh8Yi89k9OLFt7XfuHrwsCbgaXKuFktnJiB4KUE5MxZXkQtKyZ50E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JxlpAED4; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JxlpAED4"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5a2ffc34722so3551483a12.0
        for <loongarch@lists.linux.dev>; Thu, 01 Aug 2024 02:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722506028; x=1723110828; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8MGDW2w0EUrwnI4S//nT3S+vOipXyZxOwDlAdIY1JMk=;
        b=JxlpAED4oqR2gRgi4lAt9v4jqFsHhstbX3fk6rH1KuHqH8KTim9/ZwRy6y7IAJ1ilo
         SL9Wnl7vQ1Q+N6LAldn32HZB4Bw+y+T/ISNaK/CbdYjFmA2aEoivf+E3Acf2dBu3QF8+
         fqqmyed1zUuKXvF5ah7+uVjW5muhrT2C23lMeXvYEmD/9hQUl62BSdjBw0NHd3N/6sb7
         X9Z+qv5kXP4n1Ops4Ok/cuFdVoUAMSx8FjtHjLu5bNgyYzxGKCpnMsDHWduI7uv4eaNm
         Le+01isRFuWZSzzwEP2Jigx9xV+y0QJvy9OQgoMFnHM2qThXYejryEVOIqh8Sy8phFxo
         3Kyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722506028; x=1723110828;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8MGDW2w0EUrwnI4S//nT3S+vOipXyZxOwDlAdIY1JMk=;
        b=SMQBZjXF9VU31Qv/k0jz1/rVBLlr1noBatjo4MfF8nBEOpNADFr6spj1+xmz5BU868
         G75xIT+K/NODCbSSa/KS+sJffJXpEAuNJIUfj1ApmOPtoP0Gk0Fe+992WP1HenjWsygb
         UxAkA8VySgOP88pWoM5HgGyF2Y/JDTuCBbN6e+4/o7ZeMQqd/wCmnrDmbTHmNAMnLB42
         RWFo5GaZCLZ9SD39/GGPxq7Syeey8b2meUv81CB3fSVK9iX8pcuAi9IQtq6eprK8MQt3
         1s7kMWzwbJxejkaTpMXahIg9jQIqu2Gu6FZxkilL1Ck+FRVYZMi6LBtCfyy1J27vXuvE
         1xQA==
X-Forwarded-Encrypted: i=1; AJvYcCVB827HxPL3biFqmM2cVNHeLLvQYQYldT2uThzouKctD4lSBxeI+2qhDwHbxLeW9NGdkNkXyrPczwM2432kRoJa7Q8A9nBjXq1J
X-Gm-Message-State: AOJu0YyOTx8Wx6/iU6bQUBvwR8ZQvypV7mRXQzojD0XRyptPjeY9x0jt
	XVaXZxMHW2drdIxL1hGCvQoYamd2+9xK2xzr/TFyIHkMPyn7yq2YcX+LCuoPB7Y=
X-Google-Smtp-Source: AGHT+IHNrw29WKyolinu6cyXHFfq+0WsM6WXcBxZ1/oFvQaGEtI1aOWo6VY84S/JlZwJgkWdM0qlVw==
X-Received: by 2002:a05:6402:440d:b0:57d:5442:a709 with SMTP id 4fb4d7f45d1cf-5b778dc53f8mr879162a12.0.1722506028149;
        Thu, 01 Aug 2024 02:53:48 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5b5257f39adsm2866327a12.96.2024.08.01.02.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 02:53:41 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id CC0595F80C;
	Thu,  1 Aug 2024 10:53:39 +0100 (BST)
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
Subject: Re: [PATCH v12 24/84] KVM: Use plain "struct page" pointer instead
 of single-entry array
In-Reply-To: <20240726235234.228822-25-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:33 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-25-seanjc@google.com>
Date: Thu, 01 Aug 2024 10:53:39 +0100
Message-ID: <87le1gefh8.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sean Christopherson <seanjc@google.com> writes:

> Use a single pointer instead of a single-entry array for the struct page
> pointer in hva_to_pfn_fast().  Using an array makes the code unnecessarily
> annoying to read and update.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
