Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DED41C9DE5
	for <loongarch@lists.linux.dev>; Fri,  2 May 2025 11:17:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746184646; cv=none; b=L5AkQAc4vNGmaMTar/xyPVPy8c2WlToawVHrWVOfjE9Qt/ClmVLTcwiQIN9AlMSX9S83TUds8KXn7L0k5dT+GAYa6n/CKmCAgMFKY/zHqQdV8TjTy6wIs3XGofSwj3kop8AOwppirjRFOxXlBu2J6ANk+2TdShJyjdtEpH/QvBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746184646; c=relaxed/simple;
	bh=0kUCn+11GmyM4ag1Q3PeNVV9aHHIWQItyHxztuqQhPg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ixVNVHcz6AGqEqmCiNzcqYhxHdl5aF2BL6vJjEIs7TPiJqjQ7lCbkcGB3OvCiYxXZI31fwe1vyWsY24qnHFwbe//dbSEJW0U/Rmr0AZfvy/36QYvQS1mvnI0kmot7voThAluLnAy0ZaICOXIsyu13mGFOAOM5AFcZyD68qvofhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4wBKLc7d; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4wBKLc7d"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso7962215e9.0
        for <loongarch@lists.linux.dev>; Fri, 02 May 2025 04:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746184643; x=1746789443; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=p5OL8nU942aSLT09UgHbmIML3ySj45uDmdMG5/wKvHc=;
        b=4wBKLc7d0QxuZLHpdK/1e1/Njbh+njHPE1FygGDQaF3j0QxwHvchCrUWsFOzQkEcXa
         IgLKRYB+8VoGYGcZKQa8P48RSwDtDBHCpdapP7IB1z8VhIPka67v8zNs0K+Som+g7nuz
         rktHSKrbyAFVjxG7OvN2ZRi2/xyl4aFkwkP2ncaGJBL4FXvFyREPpCKwTqRTfVD2Ts3n
         BqsznobhOnfCRLJb2RVMNWirKFn77jjEYsTUjd2xdRvMNlFRxrmS55K4L+FvRhBTQ6nG
         9hahLFoMv379jLuhYwBXIlnSXmeA4LtwUCqkUh1l4BDm74IBlsaYCofd1vSdLyHNyXVx
         QzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746184643; x=1746789443;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p5OL8nU942aSLT09UgHbmIML3ySj45uDmdMG5/wKvHc=;
        b=hpOZJmbNsujAPweXni0plhVPLJF6prkvRviB3L7fw9/egNs/zFv2jgaTOw/1ty18ag
         tFZ9hVRJEaEQfi8gvhFF91rNM8OukC4ZiaDrWt9LrtFrNIsFxNHFDdnZeEoP0dvGSFih
         X77TFRIjx8H8Ah9gW1OxCYHkBiw4y+PeflkHUaP+v+arxGaFoGkqw4lKHyt2Sqs2TDVQ
         PQalk6jCoF/rCpbA9XuU+hrhCp4JT9MJyTaxd0+Dnuo1nC8orAV4+ysa3fASNcBykNFm
         NtsxsHF2BGLJI30QJkSqHyWm4Gp4iLVyHT5tcTwJUcW3f7+1FrC1ytygAkJNh2X1qujs
         ywWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj18pRWYaxtaVe1Xae8XhIUuC2cdhKpOUeCZLpHEHhFlxwkFG/wrWs7KT7GafgPMJ+0BX2N/Zi3RE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzUGIK1H1nMq/7SfJ+0IvqU4uAGg1LSy4WQLdwI1emZ94KZhx4t
	oAVXr2/WzyNDMLv88r3yNIYrOSJm8EeJoOykzVLfC8WGO/+71HoR53u28O/HcETB+uZDYqZrzyY
	5ESJZ5BXvkS0Tww==
X-Google-Smtp-Source: AGHT+IE72hvZ6mV4D/kXtlS6V50J8cDZa9GKooUY0w71JECu4b4Ctc5ADtyJqEQ5cdCjB5Oy5b/n+Jkyg9Gzn9c=
X-Received: from wmbel14.prod.google.com ([2002:a05:600c:3e0e:b0:440:5f8a:667c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3acd:b0:435:edb0:5d27 with SMTP id 5b1f17b1804b1-441b72c0a66mr50048405e9.9.1746184643608;
 Fri, 02 May 2025 04:17:23 -0700 (PDT)
Date: Fri, 2 May 2025 11:17:21 +0000
In-Reply-To: <20250502094537.231725-5-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250502094537.231725-1-fujita.tomonori@gmail.com> <20250502094537.231725-5-fujita.tomonori@gmail.com>
Message-ID: <aBSpwXh0GnuyXyST@google.com>
Subject: Re: [PATCH v6 4/4] rust: Add warn_on macro
From: Alice Ryhl <aliceryhl@google.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	x86@kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, peterz@infradead.org, hpa@zytor.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org, 
	kernel@xen0n.name, tangyouling@loongson.cn, hejinyang@loongson.cn, 
	yangtiezhu@loongson.cn, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, tmgross@umich.edu, 
	dakr@kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, May 02, 2025 at 06:45:36PM +0900, FUJITA Tomonori wrote:
> Add warn_on macro, uses the BUG/WARN feature (lib/bug.c) via assembly
> for x86_64/arm64/riscv.
> 
> The current Rust code simply wraps BUG() macro but doesn't provide the
> proper debug information. The BUG/WARN feature can only be used from
> assembly.
> 
> This uses the assembly code exported by the C side via ARCH_WARN_ASM
> macro. To avoid duplicating the assembly code, this approach follows
> the same strategy as the static branch code: it generates the assembly
> code for Rust using the C preprocessor at compile time.
> 
> Similarly, ARCH_WARN_REACHABLE is also used at compile time to
> generate the assembly code; objtool's reachable annotation code. It's
> used for only architectures that use objtool.
> 
> For now, Loongarch and arm just use a wrapper for WARN macro.
> 
> UML doesn't use the assembly BUG/WARN feature; just wrapping generic
> BUG/WARN functions implemented in C works.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
