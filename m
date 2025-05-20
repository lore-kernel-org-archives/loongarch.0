Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864032512CA
	for <loongarch@lists.linux.dev>; Tue, 20 May 2025 17:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747760705; cv=none; b=DfH8Xt3fcMVHwYxUaYaZFifqb1TkZbuE9s5mwjE/jFXwlN0OnmVzNWp+n8dy6jZdk1VCYz5wMAmA3wEeBxG1HKlG07nbQxOiQzlmA2ORJIEl0b4iflCUHvjnN0BzNfZciCn7PRmnmD0/PUhnyieRaFa7talwjxWr/ORmqr9VFLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747760705; c=relaxed/simple;
	bh=vFLiIsSNJ+9LKlajAAEpNZdNi9SUrHki3vkFk8ViS1Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FS+fnhxLfcrl6WpJeFJJ9fGsOP2e6KN9JWfOmEIZGemwAQ0a50ceHqJYFyteT+9YqLl5WPJeapmn0e4VBJnwSdzV3gG3Pwlj8rPpsfpJcvE4s2C6ys35EgNbUATB9D8icJaqYA5ERYZa/DKKgummCIyumCagF/u+jrE0vJ8JEkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iN+LflFp; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iN+LflFp"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a36c2d3104so1747492f8f.1
        for <loongarch@lists.linux.dev>; Tue, 20 May 2025 10:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747760702; x=1748365502; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aqfARpqDXwP7K8PtF8oJFF7SVaV8Ol18I4Q0qiBvla0=;
        b=iN+LflFprg4OmN2LY1XqU0MNSH0AOvxneI85NQvKJEliq9JoRcMzVG+qa+sC3M/JdK
         CBpFu+p5RU9igEjn47L1fXpB0jMB7y6WlTCUY2SdI6a4fPRAfwEUM0FTHZ+0pZ5GzgnB
         e8rwm5njkHUy0g+C4gC1k7sTHhwd1yMXWWsBzSDRML094EBo6njZO945cQQKFUfpViGD
         fZb8kIKxJ3anYIwZjRm35A3FXbDAKJvnPJOYnvyOjc/Qj2p4/ryKXlWpupBY+VSsi06r
         YVTeb8/FU+atmFhGdAjrPE42UTeSNJGLvN5pRWFsHsmVFyA5HYkOjplvcg/JeVN6/B9L
         JMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747760702; x=1748365502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aqfARpqDXwP7K8PtF8oJFF7SVaV8Ol18I4Q0qiBvla0=;
        b=oJPS/QxjY2O6GSWo6yJuc+13xKHeg9zvD2ZeIbiBHngpkgK6qWMP1g0lQKqnALqL6t
         QM4HRj14a3glQLcDsPALp5Us0ua+gA+vgDGObp1x3Mnhs7hvPpWXzDSEJBSyV6cQGt7l
         kGJG7T+JSGa6XQqwEQ1TPNWMGdiv3df/EdIC8QakDJKDQ6TgKvzzj/7cxJIcT6tIaVAe
         1yk3QLKKC3ZAp6kTtF6KjA3b+cDXn7C6Ovc4NnnADg4iVTkg3f0qpUMWXi17Z2HHProz
         rtkWRY1qRGXdyZHWG4sGK709R9rwr1ACc8rsAS6cG2rD6rlyeHi/8t1Qw8sheX8fOeYp
         WdOQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvMIU0ZkzQ2o7rt3JZeJtSDjOUnf6xzjL0JuSF8hDn/fZuKsJCEuZ9QZ69Xx7sC3wB16dEBsxYfS8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7nLXqBUbFAbhc0TODwTbcijPZcGfa+k2qR7/8lextL48L71Ak
	5jIabm5P3Qy990w2XLGNY7vPC0FY5eE9p7+8+qHAe634KcOsi4H9abavcqJESAHzBYiq+0DzC84
	h3AEStfYqTpui03Grn/BuavtLJKhSazs=
X-Gm-Gg: ASbGnct32R7hodbirrXFXAvQsT2b0z5NEkkUnd9MoWYSOAJMaVssY1KZTtn3ikHPYge
	7HfG0Ygzt+94F14kj+okaXYvdhikBz5IelT29qepiAPTo3FD/Kv7PJgu1ISReLxWvskYJ/gy92a
	31bG1eWlZxDjrp2Ku1oQMupc9KW55mpJWVSMP+YvmRMiauoXjN
X-Google-Smtp-Source: AGHT+IGoHLX8QBms8mFGB0R5FHXi2uOVwvd1emWDAK8vRyQoBWvaR0hqtnNxbsErK6XMC7RZZfSN4YoOe9vSv2a/T88=
X-Received: by 2002:a5d:5f8d:0:b0:3a3:5b90:5f38 with SMTP id
 ffacd0b85a97d-3a35c7dd76emr15608680f8f.0.1747760701511; Tue, 20 May 2025
 10:05:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250520064707.31135-1-yangtiezhu@loongson.cn> <20250520082258.GC2023217@ZenIV>
In-Reply-To: <20250520082258.GC2023217@ZenIV>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 20 May 2025 10:04:49 -0700
X-Gm-Features: AX0GCFv2NKgzITaEikgjd3zpHj5FtmD5LjKgXj0aULr_MuBKSBnhhz5OfeXNA34
Message-ID: <CAADnVQJW+qyq9wPD6RdoaZ8nLYX8N2+4Bhxyd19h6pdqNRMc3A@mail.gmail.com>
Subject: Re: [PATCH] dcache: Define DNAME_INLINE_LEN as a number directly
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Linux-Fsdevel <linux-fsdevel@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	loongarch@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 1:23=E2=80=AFAM Al Viro <viro@zeniv.linux.org.uk> w=
rote:
>
> On Tue, May 20, 2025 at 02:47:07PM +0800, Tiezhu Yang wrote:
> > When executing the bcc script, there exists the following error
> > on LoongArch and x86_64:
>
> NOTABUG.  You can't require array sizes to contain no arithmetics,
> including sizeof().  Well, you can, but don't expect your requests
> to be satisfied.
>
> > How to reproduce:
> >
> > git clone https://github.com/iovisor/bcc.git
> > mkdir bcc/build; cd bcc/build
> > cmake ..
> > make
> > sudo make install
> > sudo /usr/share/bcc/tools/filetop
>
> So fix the script.  Or report it to whoever wrote it, if it's
> not yours.

+1

> I'm sorry, but we are NOT going to accomodate random parsers
> poking inside the kernel-internal headers and failing to
> actually parse the language they are written in.
>
> If you want to exfiltrate a constant, do what e.g. asm-offsets is
> doing.  Take a look at e.g.  arch/loongarch/kernel/asm-offsets.c
> and check what ends up in include/generated/asm-offsets.h - the
> latter is entirely produced out of the former.
>
> The trick is to have inline asm that would spew a recognizable
> line when compiled into assembler, with the value(s) you want
> substituted into it.  See include/linux/kbuild.h for the macros.
>
> Then you pick these lines out of generated your_file.s - no need
> to use python, sed(1) will do just fine.  See filechk_offsets in
> scripts/Makefile.lib for that part.

None of it is necessary.

Tiezhu,

bcc's tools/filetop.py is really old and obsolete.
It's not worth fixing. I'd delete it.
Use bcc's libbpf-tools/filetop instead.
