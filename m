Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC2B15E97
	for <loongarch@lists.linux.dev>; Fri,  2 Jan 2026 22:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767394449; cv=none; b=b0X3ndTYR/HxeJsLXDpbV82zxGDghR7dTFkSZocyuzpJ6DwZy2uAmFFq0OlqvdY7+q77DaZyNR7wJ6SjiWr9ehbaANl+E37Fbf4pCWQGEsUXm92Ewb7Ti90yZ96KlhVWn3aq7e3Q0XOo6p5xTar62/k3HZad3EqUnpr4yguoWZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767394449; c=relaxed/simple;
	bh=kPMxx2R7Gx5ZxYwa7SRt+S3sFaD5KMccJKMZB0MZviE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fA29PwsGDdcsCSHXgzsjlx4bOUJ9BSpEioVNXUKq3exGdWxDKr/BZ0qyo9tA+3IMKFIa5oD2y4hcoAKEQz0KAcus9OOQwYUs3xO8kkU3PSTkL+s6y0ZqNBxduTLjMCgqrjk6mCd7HPl/+s8EhEfyHXj/BsAev5KlwIIgwPQuhpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WdPgox9t; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WdPgox9t"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-430f57cd471so5855745f8f.0
        for <loongarch@lists.linux.dev>; Fri, 02 Jan 2026 14:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767394446; x=1767999246; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StGZh5UIhFdeUEf/ngmSy2NSY5Z+LAPTFt5BciOr9oI=;
        b=WdPgox9tJLZW+o9jK4uR0nedHynwyz9dSswfHRqGMAXL8LmNKiROWpPCJJo7USfuoh
         q7HKxkNuCJ4v10rA83dYGm9guBrvKP0Y7mseh6b8lBvFIwHgckLNWHEBWfabiBNdtdcg
         YszUZhBFY7k35Dh8HOy7BzHXKZgc9Y0Ddhc1fM8K0VwKpjrIX21tBieukIjPlB+Qjpa7
         fvihd4NYptM3tGWvyqabWakQ0FHDJdp+hjaxg1mG1oo7Bw3WUyKWWnh8ACKX7IdHCaRF
         UBCSsp98kFGB20xmJWLfY8G/oa4kd2Y4KVrfHXbPRepK/3K212TuXLPVCFGnJeOP7Tmm
         7wHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767394446; x=1767999246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=StGZh5UIhFdeUEf/ngmSy2NSY5Z+LAPTFt5BciOr9oI=;
        b=kbomZQR1DtpMudN/rYtg9n41otREhqMrnqppNFHHv5GHskueEmNGgHtKo01GPpz3et
         zakaQAqVpEjJLjBSUq3GLDBO/G85kF7/0UuBSAMsAKp/ydm0h8fXtkebdkLjltX6PjHc
         QM4VZsRV4KfDhMYVS7tmheQ5ljnEr7MLW2irM2WtXu64o8URn9R8OddCf2uYoQb55tYM
         i19ufHjm00TQwI48zjHpBiT6OfmScmse0wWC/ZBAvW4ypolnvFhw3GDXoUjwiM3oCKtT
         ZHC9KFMFbKMJ7JDQBoO/+BUuu1lI8uMmoMe96qTS6Cmnqyavkr92r3PyoMIeZH41YB3N
         3mRw==
X-Forwarded-Encrypted: i=1; AJvYcCWfbhMqPSpDCGOZFf0BpxbLJyS3UEqYQxJWHDZcTNLbVCrkA8g5ngBgxhVfQ4OSwfngGTDwVlxvQcI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNqWh1Fx7YEDQ4I60k7fgRkONXyIlewh5eEB6V7s6Xefn6Y3W9
	/xS2fzRrgVttmNJr3JSPPDDu/KEdzG3C0gjw+9judzM2+pEnmm9NW6Ny
X-Gm-Gg: AY/fxX7Y/Fe0e2C1qYNPEJmf9t1RIlTbRU87e+iu1seyGHWRrcF/jR6t/WALypAdwj+
	2OEDMx1jFf/tIXG/3uN4fvbXpNejQ4NZu9K3nieCjgD4GjoklOkJKtE8MmObLNfmV/eWVO2FLe7
	LxoJQBjsXUkxVUeDfez8xhSz+VtWYvrnK0hcqxLVEkfIVTPextHKun359WPV8BS1RBqx27/gJBU
	hhdDtjFz52QINxvoUgQlvPyoVsbbmjNRoqt+SP+TU62bVSJ+MBpGUrjMY/vWcuaJ7MqflPKETsI
	W62NYb3/cPqARjsqz1Bj09neeTLJv3wQduLBXI6VnZsm4o9/Xc7rZsF//sbjlcnHJpNzKkOtRAh
	Uajv+phfmzd+A7OD6rkkMoA6yG5/AepC0P7bhyLhB56ttAFYgoDCl4AIGBEZZcr++2PxLDXuTs5
	Z37AMXK/bMh+SE4zUNc5sbzYMbJoG01vRg9cRIizU8X2OCMMcWqrz1
X-Google-Smtp-Source: AGHT+IHhZlcstoHojBz97OFk5owjy0cbb1cp4fYnQEbcnWo+WUycqSneA9mdGDNlnSrZ5xQclO2tXg==
X-Received: by 2002:a5d:5392:0:b0:42f:edb6:3642 with SMTP id ffacd0b85a97d-4324e704c03mr44422531f8f.60.1767394445433;
        Fri, 02 Jan 2026 14:54:05 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324eab2ebfsm86000586f8f.40.2026.01.02.14.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 14:54:05 -0800 (PST)
Date: Fri, 2 Jan 2026 22:54:03 +0000
From: David Laight <david.laight.linux@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Kees Cook <kees@kernel.org>, "Gustavo A. R.
 Silva" <gustavoars@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Mark Rutland
 <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, Jeremy Linton
 <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 2/3] prandom: Convert prandom_u32_state() to
 __always_inline
Message-ID: <20260102225403.78e26214@pumpkin>
In-Reply-To: <CAHmME9qHiVZwf4TAringRHSZ-yqHuPwmP=Wnx98n09jv7Vu_Rg@mail.gmail.com>
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
	<20260102131156.3265118-3-ryan.roberts@arm.com>
	<CAHmME9qHiVZwf4TAringRHSZ-yqHuPwmP=Wnx98n09jv7Vu_Rg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 2 Jan 2026 14:39:21 +0100
"Jason A. Donenfeld" <Jason@zx2c4.com> wrote:

> Hi Ryan,
...
> > +static __always_inline u32 prandom_u32_state(struct rnd_state *state)  
> 
> Why not just normal `inline`? Is gcc disagreeing with the inlinability
> of this function?

gcc has a mind of its own when it comes to inlining.
If there weren't some massive functions marked 'inline' that should never
really be inlined then making 'inline' '__always_inline' would make sense.
But first an audit would be needed.
(This has come up several times in the past.)
But if you need a function to be inlined (for any reason) it needs to be
always_inline.

Whether there should be an non-inlined 'option' here is another matter.
There could be a normal function that calls the inlined version.

	David


> 
> Jason
> 

