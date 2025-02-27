Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979A18BEC
	for <loongarch@lists.linux.dev>; Thu, 27 Feb 2025 07:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740639703; cv=none; b=V56JSTtYkY2mrU2xrB3k2YrE+Hdx/4cpxOVYMt/+SaomZtJRfkWzQ6AnMVwVNMiWiiUh+nr+GgN39uaD2AjoI1bEboKI4ta72fgIXmXcFm9kWtu5Q7d5it2xgXg093lx7eC+Fj81tKA9YBSfLqM0iWIL6i/4TfbAsk/tSFW0XZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740639703; c=relaxed/simple;
	bh=3Lqh9XizIeTyAyCLnPjf0FaLSUdoiRpcIMx554DrbtY=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=DPolkKP3EXkjbM9z9+yEE2w15C5iT7/Y/mZ9LWp9ncn63X0C2OUNq2gROsN8zmKTzVjFHAqbxUWQkbqnheMOAukwCYwAI5RAkb5vkL+v1/W//wxINyGBGnupx5GY2Wg1o/BbRcAX8bJwfCsY11fcftuVwEMQwxrynOARM7k4jlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKekOzC4; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKekOzC4"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2235c5818a3so1101335ad.1
        for <loongarch@lists.linux.dev>; Wed, 26 Feb 2025 23:01:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740639702; x=1741244502; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G4Cf2Q2JGCb1vUFOG2D8/BTiCyHZaa8abHDKG2+9Rns=;
        b=KKekOzC45buS1Smb70U59VU+hkGDK/sY9HTIIAKJrSSVKyuEyPVvpKuCc1qQXRTHuU
         gkbiKDy0sVjYkNY9iVetH4dZPHdUbQMnewtP//XesV1hw0I3iqvVy2MZEi/29G64sLeB
         r5/mHDRndfQizYLj5ybbiV83un9HbrODQoYiyRmCvTMbw3T/8OeslW5ZN8M+gqCoBtWS
         jHeufMePBZ2VeMD8prqpLF85uxXB6nGfpbPvGCnvz20oGeK5zE592PnHgIeiiZI9OwRL
         f401lvUUcEl8UijkMjDQcwLevi3cptgvDc3fULsaYVXkPU95Kcx7oJKYQ094rIRBSr3G
         uKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740639702; x=1741244502;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G4Cf2Q2JGCb1vUFOG2D8/BTiCyHZaa8abHDKG2+9Rns=;
        b=thEYi5tYF0fl8n5o04kpjwmv9vQRmcI05BOMp236IrVQfI3+pSV5MahhczZOGJcm90
         SRpZVhxNlRnFJrIAg7IHsE38pH6PBVawP2T176ZnFkJszNff/Y1K+NvftPbj+m0wl5sd
         mXSijakuB9caEqaTlHUmIc5R5Y7SXDahVk3jsiWLMbQ4X5Roko9PVuc9VltxuzcDaHmO
         cTuGAktFcyEMSOcsavBjeEL+Bhvn3gaiaK3ccaA4PlVOKx3R4n+lSl5rLBg4770WBgEx
         VhH9tocQ/1V5BhJBgIqYMg6u65obi0CYxqdY31tWg7xYmGB2IhR8K0+AizK17E5xS+B9
         Hd1w==
X-Forwarded-Encrypted: i=1; AJvYcCWc1FRlt8ZwhEa2XsuCMVsPc89EF5kd4GOz7ENUC8bcaOsaADj7aUaDKSOPpB5ZVW25+YSzlCWLmmY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQtkBypM8PHJnmGCttlmGAzSStf86KM9Flw6lKmLyYU+1x2IyV
	h4OYKKK8C6mR66gbEe6EAhRGViIhBWoykZ2ku+oIEuw7cB6kaIkx
X-Gm-Gg: ASbGncvlAQDnTCmLtR3oZ+P+KZPMWVEGEzBMXJlAyTxynGVyLYkdWzPFRj3Ct1o6ZtZ
	oUNIqnllIFfqx0vbOynbPsHlm1FutvKhpQPVbqGHAOWZYabe9Ho5s2ZvqIR0mC6gulaocurxZ11
	CJghCYytrA5m9wUlFEUph2RKi3hxcUrg7CZPElqA/chofpCNnICZPps06p/0DdSxG7roYRltTGZ
	LT8E/PxE2vjbSS/U/Hj2lbA8XiMtXSPtzwFy/lbmp3b2iRXLAm+uBjm/vQylYOKOGbCi8yA7mdm
	ghxTRhTG2sr2vwF16ka22PuCaebVKW5o1ioEUDsrsJu9SAlUt8br5VUROOP2AjXL9VJ2gQkJBhZ
	Wts7YNAU=
X-Google-Smtp-Source: AGHT+IH6Gzg0OYHyzDi78b7AFnhF1INa9SiQutoDGstlfU8EBaRq8eklnquk6k8/CG2wX5A54qoa2w==
X-Received: by 2002:a17:902:db0f:b0:220:efc8:60b1 with SMTP id d9443c01a7336-22307e6587bmr163986135ad.39.1740639701881;
        Wed, 26 Feb 2025 23:01:41 -0800 (PST)
Received: from localhost (p3882177-ipxg22501hodogaya.kanagawa.ocn.ne.jp. [180.15.148.177])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe825d2bd6sm3160785a91.21.2025.02.26.23.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 23:01:41 -0800 (PST)
Date: Thu, 27 Feb 2025 16:01:32 +0900 (JST)
Message-Id: <20250227.160132.578901242125873182.fujita.tomonori@gmail.com>
To: catalin.marinas@arm.com, chenhuacai@kernel.org, kernel@xen0n.name,
 loongarch@lists.linux.dev, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org
Cc: fujita.tomonori@gmail.com, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 peterz@infradead.org, hpa@zytor.com, will@kernel.org,
 tangyouling@loongson.cn, hejinyang@loongson.cn, yangtiezhu@loongson.cn,
 ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
 a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu
Subject: Re: [PATCH v3 3/5] arm64/bug: Add ARCH_WARN_ASM macro for BUG/WARN
 asm code sharing with Rust
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <Z79rO-wRZtN5S8f9@arm.com>
References: <20250213135759.190006-1-fujita.tomonori@gmail.com>
	<20250213135759.190006-4-fujita.tomonori@gmail.com>
	<Z79rO-wRZtN5S8f9@arm.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Wed, 26 Feb 2025 19:27:55 +0000
Catalin Marinas <catalin.marinas@arm.com> wrote:

> On Thu, Feb 13, 2025 at 10:57:57PM +0900, FUJITA Tomonori wrote:
>> Add new ARCH_WARN_ASM macro for BUG/WARN assembly code sharing with
>> Rust to avoid the duplication.
>> 
>> No functional changes.
>> 
>> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> 
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks a lot!

RISC-V and LoongArch maintainers,

Can I get an ack? Or you prefer a different approach?
