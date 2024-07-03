Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0B318754A
	for <loongarch@lists.linux.dev>; Wed,  3 Jul 2024 19:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720033526; cv=none; b=bpz2yVpO/tKWzSPA1a7cD7bTDM46FlZ86eFOFWElRxNRBWFUqSyefx6XEggxfFOaDGy9zuu4lLLdBQDF9//AbWAeBckJSD9OJg/LRjjJkwcZb9G4cZdvXoFlQ37VFgUKgwEohklDXrCuqcEoxzdvQxLlW2G5afsINm4pLvj7grQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720033526; c=relaxed/simple;
	bh=yBaVYEswZrvbgKnS47fptzlPQ1fF8FvBjoGLyqFPLwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aXqYj4lCJd03qA4DKQnD1uv9hjP0UgEiz0BXcC1WOjEI9byc5/4A5i2+NEEeEWbPK+99tbf26GzxZi9niA6nHJhMRYPCqEL1FzJrAVfbrTfTREHiGt5J47NhtS8VekDNI2LPl8iQdiV6j93nfs0Bysz8NiWtzv0lk0UVzbXxT4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=J58NIf1d; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="J58NIf1d"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a7527afa23cso451127066b.2
        for <loongarch@lists.linux.dev>; Wed, 03 Jul 2024 12:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1720033523; x=1720638323; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/Kf3K019bVOQK2OWkQy5jBzht4Y9Q+WIcCF0i+S26bo=;
        b=J58NIf1dlDVA+RRCBwZvunNvVfRgt72EJA2hZ8RZiiM2dD+MBkT6hy/g+Cr/L4//fs
         Az+uew4LooIpRUzKR13Ul5rmTLGb9o/Vb67ONv/Iv69HCceC7BKMXC0rLtoV6Q+VU6Vj
         lfVkKSzGFEh6oIg5LM/2ryA12F/iLuw9Ls7a8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720033523; x=1720638323;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Kf3K019bVOQK2OWkQy5jBzht4Y9Q+WIcCF0i+S26bo=;
        b=Yf6NLvTblD/0VaVXC99jPVfwNdLRKefnMJB/JbGFW5LDDsRnLWVA1EZ3VVgSNLthhj
         f1P/mCSY82s3W6HaThbVUVMgn6RJQe341FGguEP4fzQeEU4DPvG7ZNGx5zicBT6qWcrt
         fbf1U1ZLSEVy4MzVxEPAdAN3DTwWuWJgEx7ebp9G6ZqXtViE5ghDQngCzFwsL3yi37Js
         YRoX8y/M6M6sa/JTodRlYqP7HpUYg1smOILK/oLMYWAQwTyglvspXJLHkW6zdrr1ax6o
         nqfm9par+SFCU5zcnkQ3MSDSA1hDpymFDQK0A31PEvLA2LKl6DEt7e/TdWjqzd9iNEXr
         KYiw==
X-Forwarded-Encrypted: i=1; AJvYcCXOdOHdWz4i7zFyxQwKs7dWSW6Ojm9sC4lKSJUWEKSIPMD4F7c0Rd/wLl/m9aNTAawVComnna+qHppJkjHrkxZsjid/cKOl7iaF
X-Gm-Message-State: AOJu0YyYpKWfStJpROgiQErtkOsX8SIgppn/yH5BKWCdkWoFo0B3wI7g
	ddLp5Pv0icoiy0Xflra2BoIdZSjyixrNxvCqUJoRBJNFImyKDPNJPPTF977l8jD4ZQYczsvtLxr
	wSoE24Q==
X-Google-Smtp-Source: AGHT+IFwUUgAbHwceTNx0G06rDQMxoqauj8TcU0OYcyM4TRU9YggR9BSdz+wLCdpRodQxQNbYZQcSA==
X-Received: by 2002:a17:906:1350:b0:a6f:dc10:6534 with SMTP id a640c23a62f3a-a751449e587mr823555466b.34.1720033523170;
        Wed, 03 Jul 2024 12:05:23 -0700 (PDT)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a752cb50dc7sm261132166b.101.2024.07.03.12.05.22
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 12:05:22 -0700 (PDT)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a725a918edaso866142366b.3
        for <loongarch@lists.linux.dev>; Wed, 03 Jul 2024 12:05:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUmoA+NGniFOYn5yi7uFXetRrGgbHlpfGqtFZ7owvPoQ9a30iny/25cptvmktFHTlMSqr31DRSrd8K3g7/TLtJSdMSspXT2UWPQ
X-Received: by 2002:a17:907:2daa:b0:a6f:6721:b065 with SMTP id
 a640c23a62f3a-a751448a5a1mr1186982066b.32.1720033521063; Wed, 03 Jul 2024
 12:05:21 -0700 (PDT)
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
 <b60a61b8c9171a6106d50346ecd7fba1cfc4dcb0.camel@xry111.site>
 <CAHk-=wjH3F1jTVfADgo0tAnYStuaUZLvz+1NkmtM-TqiuubWcw@mail.gmail.com>
 <CAHk-=wii3qyMW+Ni=S6=cV=ddoWTX+qEkO6Ooxe0Ef2_rvo+kg@mail.gmail.com> <e40b8edeea1d3747fe79a4f9f932ea4a8d891db0.camel@xry111.site>
In-Reply-To: <e40b8edeea1d3747fe79a4f9f932ea4a8d891db0.camel@xry111.site>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 3 Jul 2024 12:05:04 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiJh1egNXJN7AsqpE76D4LCkUQTj+RboO7O=3AFeLGesw@mail.gmail.com>
Message-ID: <CAHk-=wiJh1egNXJN7AsqpE76D4LCkUQTj+RboO7O=3AFeLGesw@mail.gmail.com>
Subject: Re: [PATCH 2/2] vfs: support statx(..., NULL, AT_EMPTY_PATH, ...)
To: Xi Ruoyao <xry111@xry111.site>
Cc: Christian Brauner <brauner@kernel.org>, libc-alpha@sourceware.org, 
	"Andreas K. Huettel" <dilfridge@gentoo.org>, Arnd Bergmann <arnd@arndb.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Mateusz Guzik <mjguzik@gmail.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, 3 Jul 2024 at 11:48, Xi Ruoyao <xry111@xry111.site> wrote:
>
> Fortunately LoongArch ILP32 ABI is not finalized yet (there's no 32-bit
> kernel and 64-bit kernel does not support 32-bit userspace yet) so we
> can still make it happen to use struct statx as (userspace) struct
> stat...

Oh, no problem then. If there are no existing binaries, then yes,
please do that,

It avoids the compat issues too.

I think 'struct statx' is a horrid bloated thing (clearing those extra
"spare" words is a pain, and yes, the user copy for _regular_ 'stat()'
already shows up in profiles), but for some new 32-bit platform it's
definitely worth the pain just to avoid the compat code or new
structure definitions.

              Linus
