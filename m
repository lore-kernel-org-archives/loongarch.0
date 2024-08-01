Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8D818454D
	for <loongarch@lists.linux.dev>; Thu,  1 Aug 2024 09:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722504712; cv=none; b=cJAGtCIy9+6vKK/lyndT3BVDD+pMymaXdqZFEiHJxcVVEmxRiZFCRsZ3Jf2VT0SbQ/HqKXFL2Ai1Sr4ujaT7iRpC62Rt3mizprgT723hcAKcolj1O+onL9ZXdSx4XovVY0U6zSgW6QxJ2yEnEfReeEXgk/KdjQvFhFylRfLIzIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722504712; c=relaxed/simple;
	bh=Rijpxav22ULBZ/jbonQFBSqZGbACHb2Ltfu5GqR29ew=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=j6ItUAjhFaOqF++HGAx+N09XCe2yhJNoYPQkDKQzlpX19s54xWohj61hMa0dm/ZQXpV+CTh/QJpjvqcn3CgCqhHXvDke+w1GzV2NdvibGsDP2360xiNDXftnK+jylH8RlMy26PPWwucfKDjKelFuyQVd42qrYW66cdUgO5K3sZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=urgINMw+; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="urgINMw+"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a7d89bb07e7so376858066b.3
        for <loongarch@lists.linux.dev>; Thu, 01 Aug 2024 02:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722504709; x=1723109509; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Rijpxav22ULBZ/jbonQFBSqZGbACHb2Ltfu5GqR29ew=;
        b=urgINMw+C/ND7z0yDkVSltBMIO/b5/Euw0U+l+KreBMZA4ld2kKK2abuTH4tA+UwKV
         0GOiESQyi3OoBpBbHh1FKwsSdGbedholkTihec6hO6n3ODAjEb9q6/jrMSoMPQ5Vwvjf
         U4RMYZVR8L/tynVMrE4eCggPZoSsm8zyK0KqW0csZNOcCI5urrtpJf7MDyBtfioS59ii
         EI9EJa3fsoapc2Lg3mRf/GM2STErXfjIPU8Gr+ZMcXAXyczblo59PQxoKikO0Eg1lJ9L
         9zDyGI2DeV9qJfzYHImztnAbqW2j4JBtPPDcvz5DwVIjvJLM98ybhr1MIVU/uv0aaE/5
         VHDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722504709; x=1723109509;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rijpxav22ULBZ/jbonQFBSqZGbACHb2Ltfu5GqR29ew=;
        b=l3sIqXz1//owtNvWM70uLDLXYfKKAHBoUXHBc4HVFT+KGRy2AlkOFwTks0x7GSiqJy
         9yZm6GqADy6L/2RdWnCWuoMOh+HY680LSF5mzazKYGO0gW+rcypejzHpJL2V/rS/V6ch
         AqX14OJLEFix02y/DKO4qYaMYORMbbnhbMqWl0Rmh5HEZb6Wvo53In3n1oKdfjhQypeL
         AUIfjwaKrLPsLtr/Votf6DmSpt4kwpJOOqq229BpcMY7Bief6RvAeYHGiFh2F+RiYMk6
         LeFr/depat32KFo1Z+3NH0Wa6Vl2IP99mZ2j20vpuE5TcvhQdPOyie2B6Lncf6SIPurB
         mfjw==
X-Forwarded-Encrypted: i=1; AJvYcCUpat1I93Vr2LPm8ihYN0HsNHC3PSZqL1uR2jn+8owXxVT9sH+9DhZ/hwypAqKVwE1c7IrNXliy1GrqhZ8lzHt+ErEb9FgrYlAS
X-Gm-Message-State: AOJu0YwtebnCgySnizgZkeuOmnRekJ1LaoQaqtIx7djIWIC5itDQ/0E/
	Q0RdMa9YR2zFL5lq+3oUz6CLaEhMrzZpqIeP/mnfhg3UiHOwWHvnh9NWl1VqboM=
X-Google-Smtp-Source: AGHT+IG5iXbqJIGCb3pyknIex0iMsjWXZk5BqBH1pB4+wqA2VBzM+EI5zwQ/R0bb0H5+cKiu5+pmpA==
X-Received: by 2002:a17:907:968b:b0:a77:cdaa:88ab with SMTP id a640c23a62f3a-a7daf544a4fmr161420366b.15.1722504708836;
        Thu, 01 Aug 2024 02:31:48 -0700 (PDT)
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acadb8313sm876290366b.211.2024.08.01.02.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 02:31:47 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 5DD7F5F80C;
	Thu,  1 Aug 2024 10:31:46 +0100 (BST)
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
Subject: Re: [PATCH v12 12/84] KVM: Drop @atomic param from gfn=>pfn and
 hva=>pfn APIs
In-Reply-To: <20240726235234.228822-13-seanjc@google.com> (Sean
	Christopherson's message of "Fri, 26 Jul 2024 16:51:21 -0700")
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-13-seanjc@google.com>
Date: Thu, 01 Aug 2024 10:31:46 +0100
Message-ID: <87plqseghp.fsf@draig.linaro.org>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Sean Christopherson <seanjc@google.com> writes:

> Drop @atomic from the myriad "to_pfn" APIs now that all callers pass
> "false".
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
