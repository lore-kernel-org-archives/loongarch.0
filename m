Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9D6E34F47D
	for <loongarch@lists.linux.dev>; Mon, 23 Feb 2026 09:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771839723; cv=none; b=OAgvh8M+PjnTJd98w0KUyySHwMoZKPqYo2rdqQA3Dgm9F6CsviKeOt/ISFqicfm0ifeMy8ICD3iGp0LxYvnGXMOC36GhrtoM73XeQuZ7oC0oJEN72dsmTJfV/2SqmQvHB8xyXbqHZ1GSxwDbvWfzdxSjaW+NDOJfIPKmMrEjU88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771839723; c=relaxed/simple;
	bh=h2fE6FJnt+GTKQVQdqqbEpUoyJIa8aBYwbs8ZoZNJxw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UOSLqaLQOqBvcJorzuYl+Ohxa2ACSSksaWtrpmmbYtd/hwCtqe2nwrIahwYKK0+xRk5YVkSVw/JisnY9jMxpq7q24eBwhrN1U8v0Iu+jCQJdXNAQO3CEf0vzju8930/HapzsyxtIPnpXPTF5UpqixNftptJ+fezy2/6MUwvV9kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EDe0jBWy; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EDe0jBWy"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4359228b7c6so3155303f8f.2
        for <loongarch@lists.linux.dev>; Mon, 23 Feb 2026 01:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771839721; x=1772444521; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uP6bWvtU8eeL2/gAQvmkB1Apc9H5g4lS1edf4fQ7WfI=;
        b=EDe0jBWyFHm/IwHYxADKbf8Cg8QDwP+xQRHz3KIq1HcvZYpYx8jb2SGmS15XMLG+7P
         zAJAYe8EnYQaiAB1ERjORvOtJUtwifiwh40IH61x9nFM/KQmCC70MxdfBGz1P/CJR9xk
         TcWHK5Fg75WbZyg89PSmoI5LJsdb4wdxKGRjj61SBeSdSAv/QjYWMGIQ+lS8jc5wTRJj
         MOiQtgluB+alm6Mh78Tx3at6Jm4LgJ5UBfrfZM7btVjU3Y3Kddb+NeP3b/r32i4dRwrC
         WRyG5R/tRYG4OoSeeK/1d/XtaustkxT4ND+DYfqJohtg25jLk+DasmCnV5hTi51mU7z7
         E8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771839721; x=1772444521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uP6bWvtU8eeL2/gAQvmkB1Apc9H5g4lS1edf4fQ7WfI=;
        b=cZKJT5Vntoiu78HZakOFkboraHeJwI05axbhK11d2SYTkW0lvvEUhgasMDoACqA8V2
         tekNnoavuNABNQHjbC1UCJ7gi4jqerAB7F2HfxomPcW3B7ulJsGD0lyqz8PnENJEmxlK
         Q/tEyhjTsSnP8XsJatNnJc2aB9G9XbycylOU+7QSZx0AM5bT4Zfz+vtQ8FJ2CBEefdDI
         6xKhDhexGFkzmctnYTG2EdAzVAd2607YWMcSU2MfGLEcIbIT3ev00emzTd0yu+P0lJBN
         ixe/5RhU7CQbpilBrUmpJP8v2mfUgz56Ha3t/iJIwHv91WUyviCpcnizn9ajpuXN2mSk
         ItCQ==
X-Forwarded-Encrypted: i=1; AJvYcCUWYix1UW0Ly/0zbvSnWLduT8mM2sDd/y/wR16jj80b1Y6RUeqM/d2xq7fE0IbSNApl42zU9AUqnXc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yym/U+e0ZQrLol/aVpMRh3dJ9HAdGDueomys4taqVmlRYrWK0E9
	PzBnI0nHOmm6ko3ZLOmHI3x8tY3X2wROglezOkOjsjqGWZ+EuXHKGNlB
X-Gm-Gg: AZuq6aIbGviExwAad1uiuhdLjxY1tyLapjD58JLluA/1leYQnKXR1Ll0EB7Zf6XHWSW
	Pi/GFpSeNxZ1gbbrdpK/UJb1aAYeVpzsm8GHEkUhC1FN4BkUEu9NkUAoa6XKVtwjPhgv3XmXxvA
	dy8V9i1lLrPuRlEykfwZZtk7CerxOlSLl5UnZy3s/HYkfNwLdKI/FR9MawD4kvNiKaXsoyDAwHA
	RhjRJePT0ggB7gosXkyOIOrcYgwhV4u2LbjtbDkhfj6GSTf0mC9QKbz1V7zS2HbxZ5CHZRJTkFz
	zgSj8UICOxu/xKMXbAnbCxFuVns/0scvMUD65KeuQjhMPw91GESdMwOTVdcV/j0cgLxVGLGUEc9
	4dh6OCwDvKQPqyEzxn9huaXf0Pdiwerv0gd707SUi6G43f9aVcVdpApwYmxBSB7cyZsQMZsS2Qp
	swzLjf/724j4Bf6nIBvYQncjxdQxN8rgtR9wtVRM6bVswYXQIF2uFMXnxb1a/005/rcnx2ibs/p
	d0=
X-Received: by 2002:a05:600c:3b27:b0:483:702f:4641 with SMTP id 5b1f17b1804b1-483a95bd842mr121940845e9.3.1771839720960;
        Mon, 23 Feb 2026 01:42:00 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31f0330sm222508405e9.9.2026.02.23.01.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:42:00 -0800 (PST)
Date: Mon, 23 Feb 2026 09:41:58 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Heiko
 Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, Alexander
 Gordeev <agordeev@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Jeremy
 Linton <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 3/3] randomize_kstack: Unify random source across
 arches
Message-ID: <20260223094158.2197d7af@pumpkin>
In-Reply-To: <87ecmcwjh9.ffs@tglx>
References: <20260119130122.1283821-1-ryan.roberts@arm.com>
	<20260119130122.1283821-4-ryan.roberts@arm.com>
	<87ecmcwjh9.ffs@tglx>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 22 Feb 2026 22:34:26 +0100
Thomas Gleixner <tglx@kernel.org> wrote:

> On Mon, Jan 19 2026 at 13:01, Ryan Roberts wrote:
> > I tested an earlier version of this change on x86 bare metal and it
> > showed a smaller but still significant improvement. The bare metal
> > system wasn't available this time around so testing was done in a VM
> > instance. I'm guessing the cost of rdtsc is higher for VMs.  
> 
> No it's not, unless the hypervisor traps RDTSC, which would be insane as
> that would cause massive regressions all over the place.
> 
> So guessing is not really helpful if you want to argue performance.

The cost of rdtsc will depend on the cpu architecture.
To get valid comparisons you need to run on identical systems.

Regardless, the cost of rdtsc could easily be larger than the
cost of the prandom_u32_state() code (especially if inlined or
without all the return thunk 'crap').

	David

> 
> Thanks,
> 
>         tglx

