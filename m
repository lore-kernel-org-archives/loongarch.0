Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484131849E0
	for <loongarch@lists.linux.dev>; Wed,  3 Jul 2024 17:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720029315; cv=none; b=WjM8kMiXGDLBmsR5eEXzWFT0JQE79qGBuXObOvl0eiaIC9i08clFRaOjMTufCyfmvkWJFp2pv0K2u2/WogVhAuag4kwTpbXbIRqS/lIWfX9utosN6LkZLu8KyK2T1+E30O7hWhIxI49fDKegT5YqzEtdD8kad65QU8fe2dNC0tI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720029315; c=relaxed/simple;
	bh=7f1Jw4HvKMPAz77zJdFLUyAdloZi7jiFu3rAdtPOMZE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PGIKwG9vOBDS4xVepjwkBvLS+rJA5jiK3RLTN9auge06HPHZWgEofGOF4Hx7sjpmCA1soB91bm8KniJG27p3k43DmxySlHAaxdBcDxcs24IMhxZkplfOVNx1mXRJcV97BAPHGqN/r+OhT8mdek2PRD2JJNE/mGwgqC0LkD79/s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=hWVFavjk; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="hWVFavjk"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a724b3a32d2so672040666b.2
        for <loongarch@lists.linux.dev>; Wed, 03 Jul 2024 10:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1720029311; x=1720634111; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jBLAgZolniuYLkImL+HV9eymQn/u6hu6ZNMnsLo1ncg=;
        b=hWVFavjkZ/E6+QLcj+WQB8orlOTPwHgkSIDWgrn0i4WIEy58wuD0kr7Qi36PZyM1k4
         eCn2slNZsIr5VY6ZkrlYw74COalD20fqt6NDGcxCoySvFYgl/nxWUPDwgVQ078rqfBrb
         ymKm6WvaDYuyVO0/minZ//WgaXBI8Th/FmeOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720029311; x=1720634111;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jBLAgZolniuYLkImL+HV9eymQn/u6hu6ZNMnsLo1ncg=;
        b=TQRl5au5K/1yE+gV/J+BuCj4f0o4D4LxUhJHvE8rU+7lwohR3JkE0IUXFDG4Je+0MF
         NJHV0Qy6VnLmho0Qr37NMpOe54SNwqKrITHzotgE4wDoi++bnV1HObOdBGRrWh/IHgGS
         2N5WbhsgIlcDQIK6WVXhLm4F5284pQhdQIyseb5qX7uBHWRq5uaskRs4aAzOsQgeZeCj
         3X1zlY85+2KwkkQ+OH8Jg580n05DguI6cy0Oyc0WkPcocMHG2t47STsmgLEv5MMZQppu
         G3Hc45y5LtKXU8TGDqK1JwKEpnGDG0Wa0nglSuZBK1iGeP71tQqyracuDZQA2NHeJvdI
         yMGQ==
X-Forwarded-Encrypted: i=1; AJvYcCXRSAdJciUAoxOonXaFNwU53rsr88zTwhVCnL3C66n6RFqyv8B4rICNFhBws4vOZOeR1simot3pKaCNzLjJOSiNTOUFlmABNTND
X-Gm-Message-State: AOJu0YyDaNvgNwFnCiUAYjneYBrC5HKgbjeT6nCG5fuFpdyrh+iLmZAw
	dmzZMHOE8/bTusijOuynn4++nqbzmdkMnf2fZvimqvKGJdxwB766sBpTB/DsNMKCiC+pFm+A7Lb
	U/soYDw==
X-Google-Smtp-Source: AGHT+IG3U0B/NldFyiCvsCLhDu1Q/KG/MN+R2arTCE72NZwIq+qgS6cku8JB8TebF8GOH+QZNhUJkg==
X-Received: by 2002:a17:907:2cc2:b0:a6f:bc02:9ff3 with SMTP id a640c23a62f3a-a75144630bcmr970304166b.15.1720029311497;
        Wed, 03 Jul 2024 10:55:11 -0700 (PDT)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72ab065735sm532403566b.135.2024.07.03.10.55.09
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 10:55:10 -0700 (PDT)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a77b4387302so4094166b.1
        for <loongarch@lists.linux.dev>; Wed, 03 Jul 2024 10:55:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVF8eqfoiTrgeC8PtWrr5+Jz4NuK4LdmDTKM43ASew+mFDbBKmzcN7TheMSSvo4wcjHDoG1Ey8XFr8LvjscwWTObSpqqUfpcOLT
X-Received: by 2002:a17:906:7d2:b0:a72:4b31:13b5 with SMTP id
 a640c23a62f3a-a75144f61a2mr779219566b.54.1720029309600; Wed, 03 Jul 2024
 10:55:09 -0700 (PDT)
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
 <CAHk-=wi0ejJ=PCZfCmMKvsFmzvVzAYYt1K9vtwke4=arfHiAdg@mail.gmail.com>
 <8b6d59ffc9baa57fee0f9fa97e72121fd88cf0e4.camel@xry111.site>
 <CAHk-=wif5KJEdvZZfTVX=WjOOK7OqoPwYng6n-uu=VeYUpZysQ@mail.gmail.com>
 <b60a61b8c9171a6106d50346ecd7fba1cfc4dcb0.camel@xry111.site> <CAHk-=wjH3F1jTVfADgo0tAnYStuaUZLvz+1NkmtM-TqiuubWcw@mail.gmail.com>
In-Reply-To: <CAHk-=wjH3F1jTVfADgo0tAnYStuaUZLvz+1NkmtM-TqiuubWcw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 3 Jul 2024 10:54:53 -0700
X-Gmail-Original-Message-ID: <CAHk-=wii3qyMW+Ni=S6=cV=ddoWTX+qEkO6Ooxe0Ef2_rvo+kg@mail.gmail.com>
Message-ID: <CAHk-=wii3qyMW+Ni=S6=cV=ddoWTX+qEkO6Ooxe0Ef2_rvo+kg@mail.gmail.com>
Subject: Re: [PATCH 2/2] vfs: support statx(..., NULL, AT_EMPTY_PATH, ...)
To: Xi Ruoyao <xry111@xry111.site>
Cc: Christian Brauner <brauner@kernel.org>, libc-alpha@sourceware.org, 
	"Andreas K. Huettel" <dilfridge@gentoo.org>, Arnd Bergmann <arnd@arndb.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Mateusz Guzik <mjguzik@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jul 2024 at 10:40, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Oh wow. Shows just *how* long ago that was - and how long ago I looked
> at 32-bit code. Because clearly, I was wrong.

Ok, so clearly any *new* 32-bit architecture should use 'struct statx'
as 'struct stat', and at least avoid the conversion pain.

Of course, if using <asm-generic/stat.h> like loongarch does, that is
very much not what happens. You get those old models with just 'long'.

So any architecture that didn't do that 'stat == statx' and has
binaries with old stat models should just continue to have them.

It's not like we can get rid of the kernel side code for that all _anyway_.

             Linus
