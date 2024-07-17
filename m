Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE8066FC7
	for <loongarch@lists.linux.dev>; Wed, 17 Jul 2024 04:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721188950; cv=none; b=ZXTZVIxUsD/y4uSHlsZcNjdKCkYbuHmG+6C1CS8jj1OhnMjJyzew00OrdiQPcZMnbOZVKzW6DtZR9nyuUHlNvMIen7WlwpClqC6HKk3pTMkDcdMBQVQzA6sbmwr5RiokcOdj3P9zk2q/3NoeSz/vWatBdIW8aEbwaRH7umcQd6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721188950; c=relaxed/simple;
	bh=+PBwcB9983LmNCN43zPYuSin1XxQnwumx190TVwsnxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BE3V+2GXPyRh2s1B61o+TnBx6J1N/rDhmohD/AsOw9tp1YjmJyJk3mz84xq2gNl9akuzRma0dVWfUnCrEYYRT0IRREoPPqL41GeQ78sDqcYlXWEetUDYxMaT8hkdLUFcxfac1omzPbOigtzEBNrY93SASKUg2ZKjJ2DLy4BYhdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Q4+Gh++I; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Q4+Gh++I"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a79f9a72a99so71333366b.0
        for <loongarch@lists.linux.dev>; Tue, 16 Jul 2024 21:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1721188947; x=1721793747; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uFdo7pC51nfSgG7miXqI4efeygQzIA690nn8x/a17Zw=;
        b=Q4+Gh++IbfFdkTCuH6fPHTVexup7ISKKxwtM9mrTz41aw2ozkdSmojWMXnkovQZHex
         qBYQmlhUB0hwqb/6/LwrijQKYRUGWPVe5ZEjVDb7s/HGiQgjjsLVcoqGg+h5g3ff6dLx
         mUJ/ic+ibi+DUJLN6RDv/ql8CQ37E1q9n7yxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721188947; x=1721793747;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uFdo7pC51nfSgG7miXqI4efeygQzIA690nn8x/a17Zw=;
        b=NqNVHey9uTiAKWdlc8TY4iPtIfECldX4uNcUlHtC5v3amFaLz+Vq6Qc831LMy/2TpV
         DzrSl0TFcYQSZq8VyJTRrGC0Ss9UROh1WUKbqXE8tfSLaSzFJH9xiDU5OJPDEjk6bU4o
         JTHOkwqzHSVoWLI6ArbcGHSa+hP8a8wOMnvpKpyUe8UB9r3LNAyeNU8BTuHEwHij69ta
         4F2Qe0ecbSCPVkPQ3e8DsRIAS3gtSgL3vlZ0PL08jTpqE+dnP93OTsIUTY6PE03XJt1z
         CrbuWkKAflBpJlcjl4Yzcs5dLa/KKCMkBVUMa8GRPpoRN3YmqyAfUDp5GVRWv94n5BTA
         eYNg==
X-Forwarded-Encrypted: i=1; AJvYcCVsJofhyJbIa8KAbJBHOhiaTTjW2uEoQBcgeAV2qICAhXIQdhi53DGa6n2EBJD5HkYItw2ktXmfaW1DMZpnlhW0EREvx/FxxXdv
X-Gm-Message-State: AOJu0YxKwUX8nN70QU8RFgG4nwYlYHDHZhuCvVwz4roxVqajsb1LjdjB
	YwGvj+jFHSgzCvi+rRLhRtQRm2Q1SO9K0rvDxtCF0GhqPoeUAxOQ7QND9UgFDmnvBWMPPz6LJOc
	hQlWcqQ==
X-Google-Smtp-Source: AGHT+IFtQtiFtPIkROE0Sha54liu8pysypNzumVjd6Y4f5YN4gd1Wx1D+rKcwpZnEy+Su0Jc0cm7cA==
X-Received: by 2002:a17:906:c9cb:b0:a72:7a71:7f4f with SMTP id a640c23a62f3a-a7a00456a3bmr50851666b.7.1721188947070;
        Tue, 16 Jul 2024 21:02:27 -0700 (PDT)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc820ea8sm392712366b.217.2024.07.16.21.02.22
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 21:02:22 -0700 (PDT)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-595856e2336so689870a12.1
        for <loongarch@lists.linux.dev>; Tue, 16 Jul 2024 21:02:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW0NXw7UkilTQ719URaJiOAyEiGeMXkpkUxVYwe+iu9YOXIwfPGqe/mL14KaODt9ZqkGiueC96jY1ZEwPlSPYn3zwZiSlxJetk6
X-Received: by 2002:a50:8ad2:0:b0:57d:4409:4f48 with SMTP id
 4fb4d7f45d1cf-59f0c41dfa9mr3193440a12.15.1721188942100; Tue, 16 Jul 2024
 21:02:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <a662962e-e650-4d99-bed2-aa45f0b2cf19@app.fastmail.com>
In-Reply-To: <a662962e-e650-4d99-bed2-aa45f0b2cf19@app.fastmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 16 Jul 2024 21:02:05 -0700
X-Gmail-Original-Message-ID: <CAHk-=wibB7SvXnUftBgAt+4-3vEKRpvEgBeDEH=i=j2GvDitoA@mail.gmail.com>
Message-ID: <CAHk-=wibB7SvXnUftBgAt+4-3vEKRpvEgBeDEH=i=j2GvDitoA@mail.gmail.com>
Subject: Re: [GIT PULL] asm-generic updates for 6.11
To: Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, 
	linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, 
	"linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 15 Jul 2024 at 14:07, Arnd Bergmann <arnd@arndb.de> wrote:
>
> Most of this is part of my ongoing work to clean up the system call
> tables. In this bit, all of the newer architectures are converted to
> use the machine readable syscall.tbl format instead in place of complex
> macros in include/uapi/asm-generic/unistd.h.

I haven't bisected things, but I think this code is seriously and
utterly broken.

When I do a

    make allmodconfig
    make -j199 > ../makes

on my arm64 machine, it keeps rebuilding pretty much the whole thing
every time - whether I have made any changes or not.

The second time it should be basically a no-op. Sure, a fairly slow
no-op, because 'make' will go through the motions and check all the
dependencies etc, but it shouldn't *build* anything.

But that's not at all what I see. It rebuilds pretty much the whole
tree (not quite everything, but at an estimate it rebuilds the
majority of files).

And the first things I see in the build log is

  SYSHDR  arch/arm64/include/generated/uapi/asm/unistd_64.h
  SYSTBL  arch/arm64/include/generated/asm/syscall_table_32.h
  SYSTBL  arch/arm64/include/generated/asm/syscall_table_64.h
  SYSHDR  arch/arm64/include/generated/asm/unistd_32.h
  SYSHDR  arch/arm64/include/generated/asm/unistd_compat_32.h
  HDRINST usr/include/asm/unistd_64.h
  CC      arch/arm64/kernel/asm-offsets.s
  CALL    scripts/checksyscalls.sh
  ...

which is why I'm suspecting your changes without having actually
bisected the build time regression at all.

And yes, I checked - it does update the timestamps of those four
generated files: unistd_compat_32.h, unistd_32.h, syscall_table_64.h,
and syscall_table_32.h

Every time.

So I'm pretty sure it's on you, even if I didn't do the bisection.

This needs fixing, urgently. Because it turns a "small pull" into
always taking 5+ minutes for me. I didn't notice immediately, because
many of my core pulls I _expect_ to rebuild everything, but...

Btw, I don't see the same effect on x86-64, so this is purely an arm64
issue (well, and presumably any other architecture that uses
'syscall-y').

You might want to do a build like this:

    make allmodconfig
    make

twice, and then do

    find . -newer .config -name '*.h'

to find things where the build has generated header files with new
timestamps despite no changes.

There are other bad cases, but the syscall ones seem to be the ones
that cause problems.

I'm adding Masahiro to the participants, because of some of the other
files that *do* show up for me when I do the above thing:

On x86:
  arch/x86/boot/voffset.h
  arch/x86/boot/zoffset.h
  security/apparmor/net_names.h

On arm64 (ignoring the above and the syscall ones):
  include/generated/vdso-offsets.h

That 'find' also shows that the install headers thing does the same to
the ./usr/include/ directories, but the kernel build doesn't care
about those.

             Linus
