Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D0941A81
	for <loongarch@lists.linux.dev>; Wed,  3 Jul 2024 19:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720033255; cv=none; b=IF7O6Yj7mQHXB3ZadWcodOelJc40EHwgRLuDNxQTcTMicNsJS5GXWAJ+orZ8xz+sPaXoVOpCGbsfFoy5pzxCLCmqnsORWFs18R/yJAaiYLM0iaIhY3SgTMencNRFx/wSwj12KmQmxpq1ybku7kqlCLSsRBzYKaTxw7jTPtO1qlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720033255; c=relaxed/simple;
	bh=UYxPNFpMcGneQ/ECP3GOas6d4yYi/uC/3SPT66tF62M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DdpV/P2lfLQAJot6o7umrvCTY/Bln3aySchWklmxcuGIv23dGfA2P3904r7o44qME4jfQi+WwnpcZPIcIiZIRlSyDJQrG9Iu9cqljHrm6KOCWVoutJfGDmnYGbdpgKKESyUzRpUTuG9qJZhMbNHlvIRbVjmnge2umxXC0i3kivM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DAKSLrBU; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DAKSLrBU"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ee75ffce77so28440761fa.3
        for <loongarch@lists.linux.dev>; Wed, 03 Jul 2024 12:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1720033251; x=1720638051; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AwbTD1jwFh01l2fYaG95Vp8QD2DPYGRJu95WiulxKsI=;
        b=DAKSLrBU855xq9B8NPYJWvzX0xQDMwWxVDmMEAspE9glTqybxKQ+VCicOj7Nqp35a/
         GS1Z0kCfRFS74N6mAuQRsYd88Oiaq9AKcgXaJsUq2vXTzRwjEB5qZe++1PLkzgiz+5mr
         qYbUNT8ejN5+c1UKtPn+BwWRudMiiFYYqKUwY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720033251; x=1720638051;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AwbTD1jwFh01l2fYaG95Vp8QD2DPYGRJu95WiulxKsI=;
        b=GYRRuHgUFGqA0+9KU+WwupsIBiJHqZRfNjGJjNPFGX/yLoiqQV0mJFkO/g0kGJ6EDn
         rSzDcsE2ycE20j1sq51N66s3Qz/whc6xz/5WtaqJMMmYfmWlGVW8J3Yf/Z1vyE5bQl8k
         S7L/xoipQyzBiC0vBRj4gXGHe6/bHLrtQdEpNjwgAvaMEhVMBtBfDhO7sUODRL0m9Q6q
         Wsv7/jfR+OLEx4ZZvCfCg5AsNuCu7hws9vaqT5eS2gJSTx2tp4dpedP3ZMht+BahDR88
         cuMxNnWhFgCiWoTCKaLixrxViXUhCrcwXkEkrorBE79mHCzdfvvfJt/eAWXE2TXgjvM2
         fukA==
X-Forwarded-Encrypted: i=1; AJvYcCUXzS+e9Spl3I3sTuK93mzwjTCWs7iQVwqkxKUqcHizB0Y42gA32lfoOwM+TKPGIBDwx0HW5qWwzoU8bxOdh3bjfYRA3Nqj68RV
X-Gm-Message-State: AOJu0YzHuXZGV6knhkJNvBDkAtZSThFW8O/sbg9MHQUQridZ2vxOseYG
	nT7MGnBRuyHJ1FL1Zww3fXSpW819ILmqFP9fEVBMRCNEYsMDGe8MGf/XEqrE5Rv9L9bk2dem/ik
	b1VKXbw==
X-Google-Smtp-Source: AGHT+IEwOZEvMqBH8Ki7m/A3IfP9Y6+qJpj9a26BGbHJTK6z0YBi88Aq8BIgp2gHIafazciwtnOilw==
X-Received: by 2002:a2e:9306:0:b0:2ec:51b5:27be with SMTP id 38308e7fff4ca-2ee5e393627mr87403371fa.12.1720033250924;
        Wed, 03 Jul 2024 12:00:50 -0700 (PDT)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee6a86f339sm11248931fa.6.2024.07.03.12.00.50
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 12:00:50 -0700 (PDT)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2ee77db6f97so30843881fa.2
        for <loongarch@lists.linux.dev>; Wed, 03 Jul 2024 12:00:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVwUyGXHzarTNy+lJE9XrlajjiziGTe3xCkSu/yOmfRSGIj9dHItSe9IEU1mKSRe/4V0c7NbmXFardtvFWfVNkS37BHe5oU8rET
X-Received: by 2002:a2e:a7c9:0:b0:2ec:56b9:258b with SMTP id
 38308e7fff4ca-2ee5e6f60femr110934241fa.33.1720033250138; Wed, 03 Jul 2024
 12:00:50 -0700 (PDT)
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
 <CAHk-=wii3qyMW+Ni=S6=cV=ddoWTX+qEkO6Ooxe0Ef2_rvo+kg@mail.gmail.com> <20240703-begossen-extrem-6ed55a165113@brauner>
In-Reply-To: <20240703-begossen-extrem-6ed55a165113@brauner>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 3 Jul 2024 12:00:33 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgCttiyp+3BBzhqKv+uXuUr-fzw2QbmH8kXwO+sB+FAaQ@mail.gmail.com>
Message-ID: <CAHk-=wgCttiyp+3BBzhqKv+uXuUr-fzw2QbmH8kXwO+sB+FAaQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] vfs: support statx(..., NULL, AT_EMPTY_PATH, ...)
To: Christian Brauner <brauner@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>, libc-alpha@sourceware.org, 
	"Andreas K. Huettel" <dilfridge@gentoo.org>, Arnd Bergmann <arnd@arndb.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Mateusz Guzik <mjguzik@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jul 2024 at 11:14, Christian Brauner <brauner@kernel.org> wrote:
>
> In any case, which one of these does a new architecture have to add for
> reasonable backward compatibility:
>
> fstat()
> fstat64()
> fstatat64()
>
> lstat()
> lstat64()
>
> stat()
> stat64()
> statx()
>
> newstat()
> newlstat()
> newfstat()
> newfstatat()

Well, I do think that a *new* architecture should indeed add all of
those, but make the 'struct stat' for all of them be the same.

So then if people do the system call rewriting thing - or just do the
manual system call thing with

    syscall(__NR_xyz, ...)

it is all available, but it ends up being all the same code.

Wouldn't that be lovely?

Of course, I also happen to think that "new architecture" and "32-bit"
is just crazy to begin with, so honestly, I don't even care. 32-bit
architectures aren't really relevant for any new development, and I
think we should just codify that.

And on 64-bit architectures, the standard 'stat' works fine.

            Linus
