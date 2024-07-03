Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9A31891C1
	for <loongarch@lists.linux.dev>; Wed,  3 Jul 2024 19:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720034325; cv=none; b=ZqVykht4dP/gNvOGWiW+hlFKzLeXJBRUHaci/mUsKQHMaaXFAqSGuFamMAhqvTwzdu3mKUb3wBhBeDBF9+ch2U13V/avqTPdT24KEB3Smu0y9ZYYwi4tMIR5w1KaTpGrxZ68NUSghAgE57lajaGu2LBie7rgfLBbpThJ39cPTdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720034325; c=relaxed/simple;
	bh=+AVBoBhIk9uvDrY2HwwpSGMN8MBB00EEF6Yp4o9XmHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mzPYngwimIvFWaXJ+P++sjv8fjevADCK8DOOVhMky5A9+PKf01LTOR14j0tGVyF6m4Q8opnE9HnkOGS/OeXDSCCzfqpyoS3WXxVCiR7vxWP0s4MicxHMpfElEGfihRl7V/B14H5o5WuQyuDEHcVYm+CtGox7QJtdk2o7kLvmpmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=LqqPzFKk; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LqqPzFKk"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52ce6c8db7bso8877620e87.1
        for <loongarch@lists.linux.dev>; Wed, 03 Jul 2024 12:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1720034322; x=1720639122; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=X/vmIOX7+1mJHRpZ4d4vcUWyg4V3MldncLokOxZ7oSY=;
        b=LqqPzFKkO+6RCcg0QYr4FQr8UXYytOxI1XRI4Rr6zGodPLKnUJdM7mvqyL2w4EVCU8
         4f6rGOYTSEpVR728mDBoZk2iqD1ysvYnk6Wa+HRwdrZ96PjXE+0O2yWsOqndvat0uRjn
         G34UUXFR9W3qNcs8g9VMfpNnKEX5ZPEQaiHJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720034322; x=1720639122;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/vmIOX7+1mJHRpZ4d4vcUWyg4V3MldncLokOxZ7oSY=;
        b=UcZdZzegHX0GxBKmOiojzyKOZXb8VLC7s9Ho2ZXgrYpv+MulYfgJRfxvDqJBFrxT4T
         UfOr7wmh1DnVthwVLtwK7pwPgWxQVU0vEVvNER9ERYt7MITnBzXrfn4krEO//NaM410K
         jrWqCXtgoVdnnIxyLA4OAUB6Ox6BLc4Rfj9CLfcKOpMGHtjMbNQ4EpclM/jYsnBkdrKk
         /06AJ83wnRQdUSu4DC7uHkqdoE+1LT8vnHAEc5/5xjFnTvczVDEY+zY29fk4BhxyrxMv
         Sw+qKwXGWwuC8PoKic9+RJS0qWd0XV0O05iSYeq4sU+T2YOI3jwzdwdOoEYxbwLiLGrv
         v5SQ==
X-Forwarded-Encrypted: i=1; AJvYcCULTvmVRrTE5mWh8L8/hSNGIKeE7Y0bb7x8gLsben1bmo+z1VH4PTeYCesEGhvNqgAdmRHzbIazPy6nEW645vxyF+xVVZarxfju
X-Gm-Message-State: AOJu0YxXHn17OV9icRrkFVwJz8WctEkzpr386rIoqDESHwJqyu0hT0ow
	rGp+nIJBqvtossJm6JQRbtvE/tALfMR2mXTD5BWlo8MSpxB0YQLF5glWecSyCjqj/x2CtgLhzcu
	IUlCwaQ==
X-Google-Smtp-Source: AGHT+IHqdj6Vl5gPZaVZX2e7oqSesvnQZOJOCw4sb6olZgbepA77xO7ShFyFjy5I7nwe8WVVJakSag==
X-Received: by 2002:a05:6512:6c7:b0:52c:e16e:6033 with SMTP id 2adb3069b0e04-52e826513edmr8926363e87.2.1720034321875;
        Wed, 03 Jul 2024 12:18:41 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72aaf18a14sm531628066b.25.2024.07.03.12.18.41
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 12:18:41 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-58b0beaf703so3623661a12.2
        for <loongarch@lists.linux.dev>; Wed, 03 Jul 2024 12:18:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWuWG/SEg2gsoe7Qlk2IFpxnuPgTHlC763MwS3htE4RMRKUqvf+K5CkY0guYI59Ni4gHimUGEIyZXHw3Etg57rUcjB2Aqpo8emN
X-Received: by 2002:a17:906:f756:b0:a72:42b8:257c with SMTP id
 a640c23a62f3a-a751444c4b3mr871005166b.35.1720034320670; Wed, 03 Jul 2024
 12:18:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1b5d0840-766b-4c3b-8579-3c2c892c4d74@app.fastmail.com>
 <CAAhV-H4Z_BCWRJoCOh4Cei3eFCn_wvFWxA7AzWfNxYtNqUwBPA@mail.gmail.com>
 <8f2d356d-9cd6-4b06-8e20-941e187cab43@app.fastmail.com> <20240703-bergwacht-sitzung-ef4f2e63cd70@brauner>
 <CAHk-=wi0ejJ=PCZfCmMKvsFmzvVzAYYt1K9vtwke4=arfHiAdg@mail.gmail.com>
 <8b6d59ffc9baa57fee0f9fa97e72121fd88cf0e4.camel@xry111.site>
 <CAHk-=wif5KJEdvZZfTVX=WjOOK7OqoPwYng6n-uu=VeYUpZysQ@mail.gmail.com>
 <b60a61b8c9171a6106d50346ecd7fba1cfc4dcb0.camel@xry111.site>
 <CAHk-=wjH3F1jTVfADgo0tAnYStuaUZLvz+1NkmtM-TqiuubWcw@mail.gmail.com>
 <CAHk-=wii3qyMW+Ni=S6=cV=ddoWTX+qEkO6Ooxe0Ef2_rvo+kg@mail.gmail.com>
 <20240703-begossen-extrem-6ed55a165113@brauner> <CAHk-=wgCttiyp+3BBzhqKv+uXuUr-fzw2QbmH8kXwO+sB+FAaQ@mail.gmail.com>
In-Reply-To: <CAHk-=wgCttiyp+3BBzhqKv+uXuUr-fzw2QbmH8kXwO+sB+FAaQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 3 Jul 2024 12:18:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=wi=So-PDxjetjN6bs3878rOYpz8EQgU+JvrHmLF_0hgBw@mail.gmail.com>
Message-ID: <CAHk-=wi=So-PDxjetjN6bs3878rOYpz8EQgU+JvrHmLF_0hgBw@mail.gmail.com>
Subject: Re: [PATCH 2/2] vfs: support statx(..., NULL, AT_EMPTY_PATH, ...)
To: Christian Brauner <brauner@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>, libc-alpha@sourceware.org, 
	"Andreas K. Huettel" <dilfridge@gentoo.org>, Arnd Bergmann <arnd@arndb.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Mateusz Guzik <mjguzik@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jul 2024 at 12:00, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Well, I do think that a *new* architecture should indeed add all of
> those, but make the 'struct stat' for all of them be the same.

Just to clarify: by "all of those" I don't mean all the
stat64/oldstat/newstat variants that we have for compatibility with
older ABI's, but all the "calling conventions" variants.

IOW, all of stat/lstat/fstat and statx should exist as separate system
calls, and libc shouldn't have to rewrite arguments to make one into
another.

(And yes, things like 'strace()' and friends should show what the app
did, not what glibc had to rewrite things as, which is a private pet
peeve of mine)

         Linus
