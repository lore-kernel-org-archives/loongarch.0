Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0B34086A
	for <loongarch@lists.linux.dev>; Fri, 15 Aug 2025 15:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755270352; cv=none; b=m4qqDMiQR02BF7NdxXhi6efRTblVxRSGvcOwCBzwm3nwGQ2C6FpMtBiWzLAfBF2cE6LkxXjAUI45t/d6c+3Dy8rU+AsXxqH1uKYlxdBdjuTlIDqoZIYZ6s8dygsIhFWL7/gATI/rluk4BgNYdFrcE4rQgU9rwPzkI78La3Z+FTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755270352; c=relaxed/simple;
	bh=wNfhEAk3rnqID1OBHwaELciuLi86NZwkA7swq1t5JdI=;
	h=Date:Subject:In-Reply-To:CC:From:To:Message-ID:Mime-Version:
	 Content-Type; b=LkKMj6VKpd95BrWgDo5petM+P+xaW8E+Dz0aErbUGyYzTkT/ZJuMIdLDxuwIInkjFIRDeq4thrd4IKDqgzZFLhfjVcSlTm1gtTsZD6Plzue/LzVlHHHW5qwNBEbpk+04a6AX1EPaqs3Vs3kmM5kMaB2hD5lBOMQ2hxIT+7MRAUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=mMnNw5zV; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="mMnNw5zV"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-b47173749dbso1293865a12.1
        for <loongarch@lists.linux.dev>; Fri, 15 Aug 2025 08:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1755270350; x=1755875150; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=38zqqxNHqbGz3C68JOy9Ugb8wAb711DWGVbxjNinx0U=;
        b=mMnNw5zViTpRlWQJc4pm28Fl9fG6GVbrTc7QvHbRN8mbSW4ftaYavwfxndvLAhEs5B
         GqmUdCN2lKZRoAchaAjwItYStDI04oAoyj3fjahl34HyxlFTvkF8jkAfs3JtutFbmVgm
         nY9KbhiXZfNAxcANtzpEgl/Qr5cZSP87gfkIRGIacAPulo6niq+cItyOpwFkhR8sEQfI
         uOU/nXf+3yNbXDao4gKv1huVp5vtKxY7XdTUHR7AvV8j+jxN9haoUz6NL5m79O4DFKCf
         iKXttbdFOI/hfWrIz3Q+priGCV76emKXdjj/MDhg6/Qn5UzyYVYVcpzOfz1Nc0aEQNby
         Ehhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755270350; x=1755875150;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38zqqxNHqbGz3C68JOy9Ugb8wAb711DWGVbxjNinx0U=;
        b=CRWvL0oClGWBnXmj6uovEmlTtkonzaLzzaniXaiuYIjsPL4m3gl6RJipLn6ZP/vMXi
         Klmlq83jQ21ttsP6dojQqSugEvrtF4OU93/MfDxTh4YebhfcanKMCjAvnGouto23WN1R
         w3RCJn/3pzNCXfyIgwDM/+egaefUZIYy/XMEt59Pl+nQOEdj7XrhB0oPPdS3W28rebxH
         hz4RCy4u2XT8GBBlvKgJwYwI9+cv8eFSPwChVKz/xXcqe4PvsIc+hmCnCbWW1+9+lEJb
         tqWE/IElCQsuCPae4W+d282IpYjQaj7Rox9Dsk9i7+j4peR6y1LTZH0BPzgTRkuVn89a
         35Hw==
X-Forwarded-Encrypted: i=1; AJvYcCUf1UO2v5mNgQGjpOkIuGUfmaGsARt48lGP3DXQf8Omc0q37BRCAqtEo1Xa+8LX7zG8WU7LNyXLkQo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1lLMxW+NetUi9VgPqnutK4FZkqx2s+qT9cNw0aQE6by44/82x
	ymEsStzdx179kwC0wQWhbZGQsNjZ6ApfIhDVaPQ9iJgDrLahprWa3tfgb+tswKb5DWY=
X-Gm-Gg: ASbGncuzOZFiEIjsT9PcQEb3Xm/t5jM9l7SmpCgghFcFYLiH3lkfbckjNgZu8s90GwW
	VYKvnvucaP2HaPHKxDv8NfV6XN0KVMWYNmwV/9ee3P3XwWH9whDDFVtWu86bbhqiOHst74Ki6hm
	Epi+h3dNNVeFqJqtdJzTzNPwfjvkvNOUPNgEe5hE3tQHDKcFiEXmd5ntVKu1i95ca2V4JfCTR8e
	L3udBqsHkiV2TBn6T7TN+ZVw7xiDg9xIMSxu+tvob71bbzNVik5IsDRL7Kgfd3/00ISDGp/2+yO
	r9vZVtqu6sydeG/u/BhyXXvWxLWVl0o/fP2YjQngYsbGkObaebCZ3lFrEoNqxcwtoTGwFAdGdQj
	OfR3q1aj6ZdCvcnYkD3NEbQ/LsQjoDJ2Ashk=
X-Google-Smtp-Source: AGHT+IG3gBMogdOr+spUGY65daTLUVfmz5lhgO/opdXo6UimhkccgL0C2Gx+F8DUbrOBq4AI/2z6Vg==
X-Received: by 2002:a17:903:198c:b0:240:a222:230c with SMTP id d9443c01a7336-2446d5af743mr41307075ad.12.1755270349908;
        Fri, 15 Aug 2025 08:05:49 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-2446cadf96fsm16286885ad.41.2025.08.15.08.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 08:05:49 -0700 (PDT)
Date: Fri, 15 Aug 2025 08:05:49 -0700 (PDT)
X-Google-Original-Date: Fri, 15 Aug 2025 08:05:47 PDT (-0700)
Subject:     Re: [PATCH v4 06/24] riscv: elf: Move relocation constants to UAPI
In-Reply-To: <20250812-vdso-absolute-reloc-v4-6-61a8b615e5ec@linutronix.de>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Alexandre Ghiti <alex@ghiti.fr>, nathan@kernel.org, nick.desaulniers+lkml@gmail.com, morbo@google.com,
  justinstitt@google.com, luto@kernel.org, tglx@linutronix.de, vincenzo.frascino@arm.com,
  kees@kernel.org, mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
  hpa@zytor.com, richard@nod.at, anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
  linux@armlinux.org.uk, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
  maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
  chenhuacai@kernel.org, kernel@xen0n.name, hca@linux.ibm.com, gor@linux.ibm.com,
  agordeev@linux.ibm.com, borntraeger@linux.ibm.com, svens@linux.ibm.com, tsbogend@alpha.franken.de,
  ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
  bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
  tmgross@umich.edu, dakr@kernel.org, nicolas.schier@linux.dev, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, linux-um@lists.infradead.org,
  linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
  linux-s390@vger.kernel.org, linux-mips@vger.kernel.org, rust-for-linux@vger.kernel.org,
  linux-kbuild@vger.kernel.org, jstancek@redhat.com, acme@redhat.com, alexghiti@rivosinc.com,
  thomas.weissschuh@linutronix.de
From: Palmer Dabbelt <palmer@dabbelt.com>
To: thomas.weissschuh@linutronix.de
Message-ID: <mhng-5B6E084E-60EE-440E-BFF9-5E81AAC9A473@Palmers-Mini.rwc.dabbelt.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Mon, 11 Aug 2025 22:44:19 PDT (-0700), thomas.weissschuh@linutronix.de wrote:
> These constants are useful for cross-platform userspace, for example to
> process ELF files during kernel cross-compilation.
>
> Move them from the kernel-private architecture-specific header to the UAPI.
>
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/riscv/include/uapi/asm/elf.h | 66 ---------------------------------------
>  include/uapi/linux/elf-r.h        | 66 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 66 insertions(+), 66 deletions(-)

Acked-by: Palmer Dabbelt <palmer@dabbelt.com>

I'm going to assume you want to take these all together though some 
other tree, thanks!
