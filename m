Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF78839F1
	for <loongarch@lists.linux.dev>; Wed,  3 Jul 2024 19:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720036371; cv=none; b=WTGpBwlEBTxFsRv06+YXmeYsl2vJM++f/8B/GKLl0ZJTinm+Ck9q9NV3Ed4Zb2HSHSrRTqKw7320iSsynxOwe2t+jYRtwFAhdqtI04c7POJ18R5uMXG0xPoAJWVFUlggJOPx7jZliX+SqqCDB2YN+vF6WlCs/pgBGY/+cJMcO34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720036371; c=relaxed/simple;
	bh=LLTX7iSgEsmjeaKJZDhgJQFLarTCP8xjpF1SCz02LfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rYh+959VbINE4m3WNnv74VKb1l8MWMnTfM3l9zX7ojgJNFl+4J6lTDioNMcx9YYvxs9JD4M6tIQ+jXgzrg4qMI6VsOGQNlHy/pDdH6/NYXCUwpAgmk4nxyfzldSTGyAhEqiBefHjjUh+kkq/tgmnpGGiDEabu9tUIn/43sTmTIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=OSMtRkvh; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="OSMtRkvh"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-58b447c513aso3337174a12.2
        for <loongarch@lists.linux.dev>; Wed, 03 Jul 2024 12:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1720036368; x=1720641168; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FRtKeRwASst4Njswx8SNkBJ3T6bOEI9xkykNSRHU6CM=;
        b=OSMtRkvhlo3zKC+A1+7on4w/qW8ScxkaOddwxk8num4scJh1C7Ci0d9POaAO5It41N
         j1c2xOJ0S22DqbO5s70SNBYkiJKY8HKs6z1HLmP3tdQd8qBX6gjWTtLaEGomOfvTEjuU
         4hKlmTcA8yAe9ojjsO4DdHVh9DWCm6KoQYPRA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720036368; x=1720641168;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FRtKeRwASst4Njswx8SNkBJ3T6bOEI9xkykNSRHU6CM=;
        b=mMOYfB3vaJcYUCet/uFnVFtfDJMJNz44w/dqU1y/qboC3URKJpilnv4rlgZlFH+zgc
         FQ3AP7UrwhDnIB6ffwlVG0FIqpek9UX8pXVpX0asghLGyB2SYt3CPyzcJia+lyPKYeTW
         /YYU0zP1csApLR9FgbFNA9WW9yqsWPYFVZFBPkcQHUUJQb0BJdVOet5/A7BXMdqR0VhX
         qhIohIh0cFt3+CVNjCTqbOeI8jQZGDfUywY64kZ6cb8UQ8Ckox4AIkbAcWFPpQC11IaY
         r6F2qnIp1DYzTjDH7PLNfiWgWgGqmvEFwxF5Q37dI/g9k6R1j0Iq5Zl6bE81gyPqG9p1
         74pQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1b6/OOsTcKslcOT/chIOMjXFPsQwAJd1GSys9clZFLFrbaqTyMovJQpBhUqv/CURi8MZLoM1MA7AvxwHOP0qZQiwOo8ijjfn2
X-Gm-Message-State: AOJu0YyPp8N0BihrsGSeEmfShJgtNgR6y2PzHcvbtEf9+Yr5vnh7RPFg
	SKXbuMzlDj+KHmnC5ZkXH7pUvmBM8vo9TF3kop2VxU5pGG99PXO7Qsozy1C4m0ifZWP2aYfOQjA
	AVAaWgg==
X-Google-Smtp-Source: AGHT+IEnRnVOaA8o/P+h5+h6EGkrDBx0qZJpqEToT6jsfaHHT1fJFAr9rmPVR8P4nYk6aP+loWZTkw==
X-Received: by 2002:a05:6402:84a:b0:57d:12c3:eca6 with SMTP id 4fb4d7f45d1cf-5879f0cc820mr9546468a12.18.1720036368040;
        Wed, 03 Jul 2024 12:52:48 -0700 (PDT)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com. [209.85.218.49])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58d50c4dad9sm891914a12.10.2024.07.03.12.52.46
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 12:52:46 -0700 (PDT)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a7194ce90afso655450066b.2
        for <loongarch@lists.linux.dev>; Wed, 03 Jul 2024 12:52:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW7oXhjDfZdw4bj7SCVIFO4Vrsywv2fI2vFWKJY3pYp3qrIpFpkuhemYRtGQUb1hc1MVTt9Xooq5MAlVxUjqwC6thb1VPSR3W7t
X-Received: by 2002:a17:907:7ea3:b0:a6f:6aa3:e378 with SMTP id
 a640c23a62f3a-a751443872emr1062386666b.38.1720036366168; Wed, 03 Jul 2024
 12:52:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <8f2d356d-9cd6-4b06-8e20-941e187cab43@app.fastmail.com>
 <20240703-bergwacht-sitzung-ef4f2e63cd70@brauner> <CAHk-=wi0ejJ=PCZfCmMKvsFmzvVzAYYt1K9vtwke4=arfHiAdg@mail.gmail.com>
 <8b6d59ffc9baa57fee0f9fa97e72121fd88cf0e4.camel@xry111.site>
 <CAHk-=wif5KJEdvZZfTVX=WjOOK7OqoPwYng6n-uu=VeYUpZysQ@mail.gmail.com>
 <b60a61b8c9171a6106d50346ecd7fba1cfc4dcb0.camel@xry111.site>
 <CAHk-=wjH3F1jTVfADgo0tAnYStuaUZLvz+1NkmtM-TqiuubWcw@mail.gmail.com>
 <CAHk-=wii3qyMW+Ni=S6=cV=ddoWTX+qEkO6Ooxe0Ef2_rvo+kg@mail.gmail.com>
 <e40b8edeea1d3747fe79a4f9f932ea4a8d891db0.camel@xry111.site>
 <CAHk-=wiJh1egNXJN7AsqpE76D4LCkUQTj+RboO7O=3AFeLGesw@mail.gmail.com> <20240703-hobel-benachbarten-c475d3eb589b@brauner>
In-Reply-To: <20240703-hobel-benachbarten-c475d3eb589b@brauner>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 3 Jul 2024 12:52:27 -0700
X-Gmail-Original-Message-ID: <CAHk-=whZwUuYP08JF-kyBmr7w45S2z17dJKaWCFE_cfFw_T9Vg@mail.gmail.com>
Message-ID: <CAHk-=whZwUuYP08JF-kyBmr7w45S2z17dJKaWCFE_cfFw_T9Vg@mail.gmail.com>
Subject: Re: [PATCH 2/2] vfs: support statx(..., NULL, AT_EMPTY_PATH, ...)
To: Christian Brauner <brauner@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>, libc-alpha@sourceware.org, 
	"Andreas K. Huettel" <dilfridge@gentoo.org>, Arnd Bergmann <arnd@arndb.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Mateusz Guzik <mjguzik@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jul 2024 at 12:33, Christian Brauner <brauner@kernel.org> wrote:
>
> Fwiw, that's why I prefer structs versioned by size which we added clean
> handling for via copy_struct_from_user()

That works very well for the kernel interface for new things, but it
actually doesn't solve the issue for user space library versioning.

If you are something like 'glibc', you don't have the option of saying
"pass in struct and size". You are kind of stuck with the API rules,
and the rules are that you expose a 'struct stat' that has a fixed
size.

So I don't disagree that copy_struct_from_user() is a good model, but
what would happen is just that then glibc says "I will need to make a
decision", and would pick a size that is bigger than the current size
it uses, so that glibc later could do those extensions without
breaking the ABI.

And yes, it would pass that larger size to the kernel,. because it
would want the kernel to zero out the unused tail of the struct.

So the 'struct and extensible size' thing really only works when
everybody agrees on using it, and users pass the size end-to-end.

Side note: this is our original i386 'stat64':

        unsigned long   st_blocks;      /* Number 512-byte blocks allocated. */
        unsigned long   __pad4;         /* future possible st_blocks
high bits */

        unsigned long   st_atime;
        unsigned long   __pad5;

        unsigned long   st_mtime;
        unsigned long   __pad6;

        unsigned long   st_ctime;
        unsigned long   __pad7;         /* will be high 32 bits of
ctime someday */

which is kind of sad. The code was literally designed to extend the
time range, had a comment to that effect and all, and then we screwed
it up.

On little-endian, we could literally have done it as

        unsigned long long  st_ctime:44, st_ctime_usec:20;

without losin gbinary compatibility. But it's sadly not what we did.
Instead we gave the full 32-bit padding to the nsec field.

And yes, I had to go back a long time to find this screw-up. It
happened back in 2002.

Oh well. Not the first time we've royally screwed up, and it most
definitely won't be the last time either.

           Linus
