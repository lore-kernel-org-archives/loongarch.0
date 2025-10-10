Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC2D9238D52
	for <loongarch@lists.linux.dev>; Fri, 10 Oct 2025 04:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760072281; cv=none; b=LbPjSirB55y8Mp5LSMGFYH4b1dXMwr2V287QJ3fpSZjsPJ7G5SjylxYT3hKrYRiOU+t/AvByI928z9J8eT05/hzUjQ6iy/1ZT/DkSV3+V3828+5hPCstlfUYp6bHxC1kXSuECAA28Y+QuGBNdg4O2uP+mVdJvx9THs6q0T+Edi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760072281; c=relaxed/simple;
	bh=20zVq/I1A85ImSdUuzZ7bh9Qs7dqD4eEIEsQzzw5Ci4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ADa4cN6FZt7RViPRHMlxvAucyzXlFznkPkqVMK+rXqyxFqPZSU8rm1yqaluEMULwEIJgKfw9tg2uAeULRXAiswt5583Ua7yljEAy7L6fNlJc2s5AuN4PfeU+AbFQnJmWPy4Eo+vlaLpt/NjFlPQtoJWDdKBYQlqfx8ciLp8818k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PkuVLr7O; arc=none smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PkuVLr7O"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-63bc1aeb427so1693690d50.3
        for <loongarch@lists.linux.dev>; Thu, 09 Oct 2025 21:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760072278; x=1760677078; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j7qS0AM3lX7OGhXSFEYS6mkC3EKNzPxshbg7hLZcah0=;
        b=PkuVLr7OxOOEj0Ap1gkG0zox5iub9qlLZS0phcMIP6hSDj3GPr6QVtf+P+BYSZYC1s
         Go3oUhLxeK2zJc/hoOS74p6C7qfdTXvGxb2w0rHe+VUn8KNLPAvoMfTuJEfgycC7rYvw
         mKu1egsiiYFN2hcgEvJBHEx8v91kc/XKAsTzZENYXKwdThWfV1896r5RKkXsp34/hDQO
         8zebSOwIsAa0AfiQ4+/Z/9rWWiuyR0q1CoOL8Vol6ZgpphNvOx5Ru8XGY5c3E6CwK7Ta
         K1uDBY77p3SFTdLvoFQoSDPedmr/3knpac6v8Al1xgi1TJ6bqSDzLfwWZtXchCYBm2yV
         H9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760072278; x=1760677078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7qS0AM3lX7OGhXSFEYS6mkC3EKNzPxshbg7hLZcah0=;
        b=TAcHuwPTdpNZpzdbBHj8Q2XLYC673Y2XDlu7pyINtT/NOiOz/u8YuDNzfIP9GWlues
         9JzE+pPI7E0AfEvd8VQpFnEMmSXWSJxOInsAvLrVYwegcgHAr3x0rY4ePEy2bf99kHm6
         ugfnym/iTdojSYN20zRHAz4AJ70fwDJylCPA1fHVp/Lw34/Znvsk2ziItyOM/kGW6nHq
         Q/sX3EKORa3uLdw5JKo1Vno7dhleoIvWaGd73kWEn0CqYfA7ku0MiGNrFihLg+CzoYXx
         wTFa7PtDn3LGHIFrZHsx7/jyqVCk8Vuk1fTvYv6rxCOVnlP+Jm295CR6DUu3E8wh4k/A
         dSLQ==
X-Forwarded-Encrypted: i=1; AJvYcCXWg684uSZpRnXghaMNEkQMHiacXAojVOXLdzGYEUsoWi4MSSZmobAZRXzU2K9xoNpqoQfsbIoc5AI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxAmGvKiqGHA08kqcOg8UeVt4FDWRVv3aAY2/0vkFMwqbwaoDol
	XHvLo2LDELcQbX1aVbKbJDgUWYCjYmAGVHgg+Zn6MzpKI/JPpsZgr8SH6l5YK5GPrSg487lbrfS
	X/DZByqaI3IVdF5Sf8vt31LmJ2y/ZzaI=
X-Gm-Gg: ASbGncs6rFd+uyT7qdA1C9htV3YN4/aCAVsJqlS9UwoYjFjKi5dgcfHPY455z1Mqmh3
	TYqRLhbrr/ZMrP5hdTLraD9YPgfOIzIf9dUKhPDdXhbIh/NfuVCrN4fOUnyMfOT2jQVrxPW5I3S
	y8vX+KEey44AXFPGRyp0I3bpQ2aX35WyuaOdBSHFIEXNtNYfzxE+e8y+9W/QZfvVb5HU5CmOz7/
	4qUL+KEFZNsZoD5UnwJILoHQQ==
X-Google-Smtp-Source: AGHT+IHqDciv7GAPYfMGdKr9Fwuo5GT168N8GcrpsJ5KozP5HqYqg/LDALxuogvzJXgNCm6zrA+DoCqu7lr8uhQrVc0=
X-Received: by 2002:a53:5009:0:b0:636:2420:d3ce with SMTP id
 956f58d0204a3-63ccb93456dmr7466309d50.51.1760072277565; Thu, 09 Oct 2025
 21:57:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAHNNwZC7gC7zaZGiSBhobSAb4m2O1BuoZ4r=SQBF-tCQyuAPvw@mail.gmail.com>
 <20250925131055.3933381-1-nschichan@freebox.fr>
In-Reply-To: <20250925131055.3933381-1-nschichan@freebox.fr>
From: Askar Safin <safinaskar@gmail.com>
Date: Fri, 10 Oct 2025 07:57:21 +0300
X-Gm-Features: AS18NWAQwCKadWHXCZjVUBNaD3TaKIilJiJAQzSbvGFaYuFuE8UDpW1_H3riB-k
Message-ID: <CAPnZJGBPyONjJoM6cskxysDnN4pxWuWJCK5A6TgikR2xHsrN5Q@mail.gmail.com>
Subject: Re: [PATCH-RFC] init: simplify initrd code (was Re: [PATCH RESEND
 00/62] initrd: remove classic initrd support).
To: nschichan@freebox.fr
Cc: akpm@linux-foundation.org, andy.shevchenko@gmail.com, axboe@kernel.dk, 
	brauner@kernel.org, cyphar@cyphar.com, devicetree@vger.kernel.org, 
	ecurtin@redhat.com, email2tema@gmail.com, graf@amazon.com, 
	gregkh@linuxfoundation.org, hca@linux.ibm.com, hch@lst.de, 
	hsiangkao@linux.alibaba.com, initramfs@vger.kernel.org, jack@suse.cz, 
	julian.stecklina@cyberus-technology.de, kees@kernel.org, 
	linux-acpi@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-api@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-block@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-efi@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, mcgrof@kernel.org, 
	mingo@redhat.com, monstr@monstr.eu, mzxreary@0pointer.de, 
	patches@lists.linux.dev, rob@landley.net, sparclinux@vger.kernel.org, 
	thomas.weissschuh@linutronix.de, thorsten.blum@linux.dev, 
	torvalds@linux-foundation.org, tytso@mit.edu, viro@zeniv.linux.org.uk, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 4:12=E2=80=AFPM <nschichan@freebox.fr> wrote:
> - drop prompt_ramdisk and ramdisk_start kernel parameters
> - drop compression support
> - drop image autodetection, the whole /initrd.image content is now
>   copied into /dev/ram0
> - remove rd_load_disk() which doesn't seem to be used anywhere.

I welcome any initrd simplification!

> Hopefully my email config is now better and reaches gmail users
> correctly.

Yes, I got this email.

--
Askar Safin
