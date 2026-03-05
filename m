Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A681A3E1237
	for <loongarch@lists.linux.dev>; Thu,  5 Mar 2026 17:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772731614; cv=pass; b=fYfas/mpRV0yNtR8ypgn4x8Njc/7B8st54MMGmkxmkhPJhMnmEid8mepBAe5oLdpcNO2p+0APHcTZueIpeqgikKg04OB542WLDlzwjF4E7AuNlLtiJa7+XVOujqMys9JAaJ3ypEBWuGWw+QEV5ZegSmHtrzjTf7ap5FylUANiMk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772731614; c=relaxed/simple;
	bh=XOVsdktOF6nyNimRfFhPjPXph4/eizuY/zAJWFeEW6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pTIizKZK0WeRGTtCOkkfMvYcbpvDxx4hVpv1uIPNOxfqZKXAJFoum2DxhLBhRmYRrT163SWXVVo/Af7qKghUK85bDC3Z/U0dH1oMsUY7L3Rq+SaQx92HyzHTH7S7+0ukSCPK+xZjXhGf8zNf/HlJRU5BAy8mCcDxcZkA5WUPSa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1sFg6rVr; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1sFg6rVr"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a1307438ddso1049860e87.1
        for <loongarch@lists.linux.dev>; Thu, 05 Mar 2026 09:26:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772731611; cv=none;
        d=google.com; s=arc-20240605;
        b=dNUcrDMGRBjcLSJESau4fJw1Ajq0XJKLP0giI5Cq1qwk7FyDdbG60iVnh4F2uIoKEx
         F47Q9fVa2pL6cgZf0y6biWok5vkdK4N9YSGQ0IQa+w4QdVgaoQwcA9jlGMNpOwjjNZYA
         qgkQpQN6pERRWtoxIykTTgZi8DWm7eNO5J+OI5D/6sSV/pOFr0+PXMpD6pfU/IuuZfZ1
         xquUWvqvbD0/4DqzyOj0zN56wWBUuwobbMaBWGZ5o6iDH10Xse2DJiVlhZ166YY9gA2T
         soppChjED8rgBS1ac4bOaI1cZ/RD9fBbnKmVnqZOH9F11CzldfzgU8j579MHB858Chkd
         6/7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6jfkQGEN2Pma+dwki2mI0eTQpR2nMlH81M8JJrATtW4=;
        fh=PwMOLsdbkDxHr4S9SwR/Cm5U8kNCs9d07y/wRqh/q/A=;
        b=G6CBTJK4Wd36LVJrL+ZglFVJBDocwwaed8XMJGw9AY/HUyaIj32YG/yvZ9ddm39NMX
         z/Tx3yu3+ZhnN3K/GhdZblW/HZBsAQSpVwnriDy6BEadbEtGOQDQRNLF7eJQ+u1zTDpd
         UTeEnXKmlqGWpebhHljiwQRXbjcp0p9ifgWszhGbzx0jhMGnT2HuCjqkVs355UsM9Tkt
         eqZw2oCcQBa3XC3StMWyjxifukGphrCO9+4PlOOApqDCtsUgAejQ06hB+zsOU0NghL1Q
         VfJz5waSA5lENuwjsJJK0i8klIU9L/E6P4t9yOlDRkD9Kczz+yJWWnPniRMh0RNPKQBA
         ueAw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772731611; x=1773336411; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jfkQGEN2Pma+dwki2mI0eTQpR2nMlH81M8JJrATtW4=;
        b=1sFg6rVr610kMpiCOyxBF5yQC4uz7Pw5dCsfWirB5URLASZ4E5xoUGkTl/EIQXGsq/
         tvnh9T033QauoXrfG7YmUJ0thDtITHTkJ6oEqhS/nvf60kaEm89zOTXfPDE6CT+v2hiS
         kA/lCXtO/t2N5am0oQf+XT5GJEeAA8E+DIw/1RflRrEr/jPmm9O92TlGnynEe95pX8+W
         lXqhuPoi9C344Ezo6V84uBCsqZHQlNwnMtpX15HAKtXC+GncUSSzWIwZQUXaJXku5Qii
         ViaOjLO9RVxiLAKNPSqGCXXuWvkONBbbEaEtveEgH6gpD5xYbH0LxEGvd5Ce/e1hWjB3
         zepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772731611; x=1773336411;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6jfkQGEN2Pma+dwki2mI0eTQpR2nMlH81M8JJrATtW4=;
        b=QS1SNLNvRLw6x7DHtA6E/+/EcbwgFEAvh+n/0ikvkyfeAbjAv8rRaOkgxKuXJehM2M
         YxgJ94m6wPnXGuQ73k0XqcZQxqdvA/JyFHbIxzAUjszScCAnX1IYLec59RFP3W59ii7u
         YVfCDxNWcavwnSSdQmMv4z6tmIA5MtFQ/FYsZJOYbQgDN2EIyQ4hBAYnmiVO91wRgx3G
         8pH+4a21xE65cQTds7kTzd82rYrbO3bu+uhqCPSva5q6rA/jJZwXJxeXA9LgLqxoxAe1
         /prBm+0cKVrlK1cdHBq3uI6nvzvLGC4OHk9+j2xKcD85GCoZ4h4R1Xw5+L3KlWkY1zZL
         289w==
X-Forwarded-Encrypted: i=1; AJvYcCVsv3LEcaYvx4vJN03qsQVMkQCx6dKAEXsA5PlWjFXXsBza4oKkAvT3A4tdxj32o9Acx1vKR9PmHfQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+BPpZ46YDoDi1SdEOyvr3vjyvdF5/rZRxxDK6usRN+St/mPSS
	rKjGVlAMfylsZNH/2k3G90UYtpSsZRhyAV1efqvHK7QDY1E2o3S8OKRZYSzJf+zJHtDHBs8bXse
	yJVogLvEc+hDv5FUp4uMfKomd0TgijfaNUpF0zeik
X-Gm-Gg: ATEYQzxJRd28s5JgVGb6Xpt1LCcnTmFZbpycBSivbNXI5WGFvn077T1v9QNzAn/SATj
	z0VUt/EZwg/m6ta1ubiVazxcpD7kDyaLFq+DyYSYJAYMYJy+QvSnwFKoRZ+2ZvZQCFrRGB+MoCb
	r4xzIr4Ex0tVG6Ep1LKoFT1c7foZBaVl0LuI7sFgEplKJP9y7in56Acbn8F+sPWH5SegPn//FGq
	oaxjWFhLSMj5swS89Xp2U4tzxVZP668scIFSKrkgCYrz23Awjj092a07u/sNUEjv5WPT4/Yyc/Y
	k6JzO+iy
X-Received: by 2002:a05:6512:696:b0:5a1:2f18:5e19 with SMTP id
 2adb3069b0e04-5a12f185e8bmr1324271e87.22.1772731610293; Thu, 05 Mar 2026
 09:26:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260220004223.4168331-1-dmatlack@google.com> <aam77t8fe5RKSr2Q@google.com>
In-Reply-To: <aam77t8fe5RKSr2Q@google.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 5 Mar 2026 09:26:22 -0800
X-Gm-Features: AaiRm52LsX1aPJ2JM5xqUBPHr_QH0uBSIJaRMA7nyUfm3apWkfHV7m2i8095U3w
Message-ID: <CALzav=etzo9A7FNQrbLCmj=pNLN5fO-a5isP1k6MuTDkJw1bqQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/10] KVM: selftests: Use kernel-style integer and
 g[vp]a_t types
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Ackerley Tng <ackerleytng@google.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atish.patra@linux.dev>, Bibo Mao <maobibo@loongson.cn>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Colin Ian King <colin.i.king@gmail.com>, David Hildenbrand <david@kernel.org>, Fuad Tabba <tabba@google.com>, 
	Huacai Chen <chenhuacai@kernel.org>, James Houghton <jthoughton@google.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Lisa Wang <wyihan@google.com>, loongarch@lists.linux.dev, 
	Marc Zyngier <maz@kernel.org>, Maxim Levitsky <mlevitsk@redhat.com>, Nutty Liu <nutty.liu@hotmail.com>, 
	Oliver Upton <oupton@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
	"Pratik R. Sampat" <prsampat@amd.com>, Rahul Kumar <rk0006818@gmail.com>, Shuah Khan <shuah@kernel.org>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Wu Fei <wu.fei9@sanechips.com.cn>, Yosry Ahmed <yosry.ahmed@linux.dev>, 
	Zenghui Yu <yuzenghui@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 5, 2026 at 9:22=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Fri, Feb 20, 2026, David Matlack wrote:
> > This series renames types across all KVM selftests to more align with
> > types used in the kernel:
> >
> >   vm_vaddr_t -> gva_t
> >   vm_paddr_t -> gpa_t
> >
> >   uint64_t -> u64
> >   uint32_t -> u32
> >   uint16_t -> u16
> >   uint8_t  -> u8
> >
> >   int64_t -> s64
> >   int32_t -> s32
> >   int16_t -> s16
> >   int8_t  -> s8
> >
> > The goal of this series is to make the KVM selftests code more concise
> > (the new type names are shorter) and more similar to the kernel, since
> > selftests are developed by kernel developers.
> >
> > v2:
> >  - Reapply the series on top of kvm/queue
> >
> > v1: https://lore.kernel.org/kvm/20250501183304.2433192-1-dmatlack@googl=
e.com
>
> Sorry, I was too slow and missed the window to get this into kvm/next wit=
hout
> causing a disaster of merge conflicts.
>
> I don't think you need to send a v3 though.  I'll prep a v3, a branch, an=
d send
> Paolo a pull request during the next merge window.

Sounds good, thanks Sean.
