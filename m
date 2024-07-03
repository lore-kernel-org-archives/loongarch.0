Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6251836EC
	for <loongarch@lists.linux.dev>; Wed,  3 Jul 2024 17:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720026576; cv=none; b=mrDbVjllRf9g1UGNkHpIRckvT6D3tfS/lh3Gep4cjPdjNWrUR6sliqJ0kAKKh1FrKXVqPlYkMeRuRM8LSaeADaPfkOogHIz1hZHXR1ycmkvUjH4HwH8vAEQX4UFp0e2DwvqXHobAJJoAlg4CiNVZezspmmrp4KKkNVsdOPXvXYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720026576; c=relaxed/simple;
	bh=uRU/MzlOzw7CmWbyItl0EyiCdZwjkjyxkrbpjs0FjXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OEVAQUDnFgbIlz8QWcChgKExDY8qnWnSfjh39fnhaKlps6tvrA2lsttWzUPjnVpCImxtvKCnVLGYlUn9AVe10ZVgpg6QQNOre2ERzSSvtha2B77Ow1GgIywpi+8GVgKgGIJGPGHVDBqyNm1282QWYub1b47YYdb0MZfX2Gc1OO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=fm21faqw; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="fm21faqw"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a75131ce948so548641766b.2
        for <loongarch@lists.linux.dev>; Wed, 03 Jul 2024 10:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1720026573; x=1720631373; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kRpbCtw/E4IRbKxwJt2blPeYec2wEFVPadTklw6HsWc=;
        b=fm21faqwYG9kxzfoHPIVPcGFD/f/WIP5ys/yCc6I7mVs3ntRTjeOwWSJbPhzx+dcCC
         7qdfIGUaIw89IxmD7aW4OexiyvruCYsfeNiwhmH3+96K7Ur38b9dytNKRB2AvBGBYPRI
         zImbJf3UF28aVahXTXFJhIaqbRtG8JCAm1Odg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720026573; x=1720631373;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kRpbCtw/E4IRbKxwJt2blPeYec2wEFVPadTklw6HsWc=;
        b=Y70qP8qMcDUmC8z6IMkzmo+0COvLwNsZp3D+vhlG7m+q/K1OjyaS6JJdEGNQKWkJTS
         ZnmVOkePyn7YZ3fokM7TghWeQ5mHlxzvWVGdSzKkP7E1QyEmAOQxlojachZdWBFe4C8H
         z333pxMqs0sEi6CEtOEeJIDT6v6T0hIoUeYZ50dKbMsH7pLpE6jdTCffTzuYbCVUhabD
         Iyg46lW7ZudisS3AhIraFIHamYrfpJW0KU2cuAf/ie6g/yKE1z23io0p+UYMxRWEeqEM
         B5jseJpr9ouHBtNC5Ih/xDwCK6N23ifvpEUttLMrLiEQvOZ4MNzowuntw50mbKAmCGBD
         5KYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxzsJvoe35bizeBR2JQ5tveV579shl0NmiEYc0R5S03WsG1zoSOHKE6qEChwGaogOxVVIuOlMDBKY0SD5RudZ9s/MS2KkgRbi7
X-Gm-Message-State: AOJu0YzNpk2BKMf6ulOnvtiswuPtl+SA2LN4BrIkwphhHKyG4jqMtTgC
	52hB8Nq9io0qQrZ77Lv3YEb5BCw1karZQoKG5vye+rcmh2rN+mzwj1xIehrdK9LXtdUTrbPOqAO
	LMrA4Ng==
X-Google-Smtp-Source: AGHT+IFgU4tuExeD+/+ToFFU30CEyO0pqADdZa2kVJQ+B2wkdevFjfecQY5efACD2ELX1VZm3ZW4Jw==
X-Received: by 2002:a17:906:8307:b0:a6e:d339:c095 with SMTP id a640c23a62f3a-a75144a2853mr780444466b.47.1720026573034;
        Wed, 03 Jul 2024 10:09:33 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72aaf184a2sm533957666b.11.2024.07.03.10.09.31
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 10:09:31 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-58b0beaf703so3464424a12.2
        for <loongarch@lists.linux.dev>; Wed, 03 Jul 2024 10:09:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+ZjVIi1sMFCwnTG4wTZ4GuaMpyEoL9bfHMaGCj7aC8fKR4wiz8MV1CnViPh1v20QCJOfqFkA1boNGKZG/zfBf6716UCsn33Un
X-Received: by 2002:a17:906:f756:b0:a72:42b8:257c with SMTP id
 a640c23a62f3a-a751444c4b3mr853732366b.35.1720026571539; Wed, 03 Jul 2024
 10:09:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240625110029.606032-1-mjguzik@gmail.com> <20240625110029.606032-3-mjguzik@gmail.com>
 <CAAhV-H47NiQ2c+7NynVxduJK-yGkgoEnXuXGQvGFG59XOBAqeg@mail.gmail.com>
 <e8db013bf06d2170dc48a8252c7049c6d1ee277a.camel@xry111.site>
 <CAAhV-H7iKyQBvV+J9T1ekxh9OF8h=F9zp_QMyuhFBrFXGHHmTg@mail.gmail.com>
 <30907b42d5eee6d71f40b9fc3d32ae31406fe899.camel@xry111.site>
 <1b5d0840-766b-4c3b-8579-3c2c892c4d74@app.fastmail.com> <CAAhV-H4Z_BCWRJoCOh4Cei3eFCn_wvFWxA7AzWfNxYtNqUwBPA@mail.gmail.com>
 <8f2d356d-9cd6-4b06-8e20-941e187cab43@app.fastmail.com> <20240703-bergwacht-sitzung-ef4f2e63cd70@brauner>
 <CAHk-=wi0ejJ=PCZfCmMKvsFmzvVzAYYt1K9vtwke4=arfHiAdg@mail.gmail.com> <8b6d59ffc9baa57fee0f9fa97e72121fd88cf0e4.camel@xry111.site>
In-Reply-To: <8b6d59ffc9baa57fee0f9fa97e72121fd88cf0e4.camel@xry111.site>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 3 Jul 2024 10:09:15 -0700
X-Gmail-Original-Message-ID: <CAHk-=wif5KJEdvZZfTVX=WjOOK7OqoPwYng6n-uu=VeYUpZysQ@mail.gmail.com>
Message-ID: <CAHk-=wif5KJEdvZZfTVX=WjOOK7OqoPwYng6n-uu=VeYUpZysQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] vfs: support statx(..., NULL, AT_EMPTY_PATH, ...)
To: Xi Ruoyao <xry111@xry111.site>
Cc: Christian Brauner <brauner@kernel.org>, libc-alpha@sourceware.org, 
	"Andreas K. Huettel" <dilfridge@gentoo.org>, Arnd Bergmann <arnd@arndb.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Mateusz Guzik <mjguzik@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jul 2024 at 09:54, Xi Ruoyao <xry111@xry111.site> wrote:
>
> > Honestly, 'statx' is disgusting. I don't understand why anybody pushes
> > that thing that nobody actually uses or cares about.
>
> Hmm why it was added in the first place then?  Why not just NAK it?

There are valid uses of statx - they are just VERY very few and far between.

For example, if you want the "change cookie" or any number of other
special things that aren't standard, you have to use statx.

But _normal_ programs will never do that. It's unportable, and it
really is a specialty interface.

Pushing 'statx' as a replacement for 'stat' is just crazy. It's a
different thing. It's not a "better" thing. It's an extension, yes,
but "extension" doesn't mean "better".

That's true when it was mis-designed in certain ways that we now have
to fix up, but PARTICULARLY true when it's nonstandard and no other OS
has it.

> And should we add stat_time64, fstat_time64, and fstatat_time64 to stop
> using statx on 32-bit platforms too as it's disgusting?

We already have 'stat64' for 32-bit platforms. We have had it for over
25 years - it predates not only the kernel git tree, it predates the
BK tree too.

I think stat64 was introduced in 2.3.34. That is literally last century.

Anybody who tries to make this about 2037 is being actively dishonest.

Why are people even discussing this pointless thing?

            Linus
