Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0454CDEC
	for <loongarch@lists.linux.dev>; Sat, 22 Jun 2024 22:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719096102; cv=none; b=plxe/zjI3KMD5WH+stSquSN+nMM74VWazTNAqZYQb9KHsgKuboasTNVtChxM6n72nIta7FDvAYeUUD1Uv552cYPXcQeirfdiDmA3mwEg6BcMoEMciNUmy4ikw9WreR3vBGCID9RrJ/S2aPz6Q6LzTafT+ceW0r+A8sOyvktmWNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719096102; c=relaxed/simple;
	bh=kqyVjEgP3/7mXzKVNMbYCUNnf3n+IgnYTEx7zPeTiw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YL01Ld1kHRfZkiSb3y/rL6t3Hary/ehb+QBiRbGGgbmWhtE3y3CGUynXcFsRpzIw5MLRQHaLmGtAC93tWvngJSG7kfZMIbHrO0x6OIqObKDWJNMwmm07J1QvIWz5/Raejsl0PlDIlrjatGUOn8XiDIi1r+XdSqttXPEJ19Q+WQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=dP6PusHv; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="dP6PusHv"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a6fdd947967so89713466b.2
        for <loongarch@lists.linux.dev>; Sat, 22 Jun 2024 15:41:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1719096098; x=1719700898; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZntylMGkkO3rfxQI8jPvTsKY/9VRyoYvjHsl0ZwmXlQ=;
        b=dP6PusHvUm0uWazkKMBVDndlUeb/CYUq36NeqPAxd+mHoJHeTpASieRMbkuV4N0Ck5
         KzZyK9fPudunUkEWd1gNLLD2CHtdr6jHBh6YE5LLB4MauiJLAKtgNH3ObYjmpCgIQQZq
         lSI3kj8DO/fCMFWppLd1l70RDTc83wtMNgDHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719096098; x=1719700898;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZntylMGkkO3rfxQI8jPvTsKY/9VRyoYvjHsl0ZwmXlQ=;
        b=eyaOpb66xaqqGGuT2JR0G+JQlhxTRdSGShcFh0g3pYRtHE/Sl1V4AU3j1N8uJpBLE+
         JiZEVTs4ExqctzUDTSSEO2yGyqHCjkvL/dKO/WqTs03J2MwGgQoDNRNZ6dy9RSgxs892
         wfmEk28hkE7L0wUDb09DxIWNRHJ6xKQSuK+QV/taX1tBJZzTgnYeFqt8Z4BSYkViKSLE
         C8BWqUFVuiZ5imQ1/GxlAaqoGbXuKCC73+Ay++JTMkngIhQo4hPEoDgIwRo20ABDIjoT
         37HCIhXrdeDxQGir8N1AIS6Xc48uG7vlsG7DCICW7PmvqHcdSddMUzZCHeEuWJwttqFA
         8Bjg==
X-Forwarded-Encrypted: i=1; AJvYcCXykOC/+sn0ZUuTBRhV2FOay3fZQloJgOg6sH/Uo0x8vtATLRzySnrLFRYCGpjuWK16GGVi4SzvvtcMBVofBOMEdQ060tke0hxV
X-Gm-Message-State: AOJu0YxKAVL8ZZnnKgkO7uOmoJP3Q3GO2rTf7plE3l7RWIzIZNKZ/opf
	ff2Sb66gAo+WG7JvXodjiR8QwCNNe8Ag8P8luR9FynXn6S2g+QkXKxyWbJstsdCAWbtOl284cGW
	ZI2E=
X-Google-Smtp-Source: AGHT+IEsw4Sk6+elGMJJWHYzE4u9uljjvBJK/78UwvMkscBWNswMGH0IpsSXkNJx9C/wVG9gWhOAuA==
X-Received: by 2002:a17:906:9c8e:b0:a6a:ab5:6f2a with SMTP id a640c23a62f3a-a7245b817f1mr61330466b.11.1719096098219;
        Sat, 22 Jun 2024 15:41:38 -0700 (PDT)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com. [209.85.208.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a72465079a2sm34146466b.205.2024.06.22.15.41.37
        for <loongarch@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 22 Jun 2024 15:41:37 -0700 (PDT)
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-57cf8880f95so3565546a12.3
        for <loongarch@lists.linux.dev>; Sat, 22 Jun 2024 15:41:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVyMFqyZxJR1f/RYenM56dsT9swsTCKcle88Gb5+ArDwFTOWdIyiYsG0x+Ql1CKcSwFNmSXWmqHZf7GjBFmS3zgD7Fstc8jbNKc
X-Received: by 2002:a50:d653:0:b0:57d:785:7cbc with SMTP id
 4fb4d7f45d1cf-57d4bdbfae4mr617930a12.26.1719096096671; Sat, 22 Jun 2024
 15:41:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240622105621.7922-1-xry111@xry111.site> <kslf3yc7wnwhxzv5cejaqf52bdr6yxqaqphtjl7d4iaph23y6v@ssyq7vrdwx56>
In-Reply-To: <kslf3yc7wnwhxzv5cejaqf52bdr6yxqaqphtjl7d4iaph23y6v@ssyq7vrdwx56>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 22 Jun 2024 15:41:19 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgj6h97Ro6oQcOq5YTG0JcKRLN0CtXgYCW_Ci6OSzL5NA@mail.gmail.com>
Message-ID: <CAHk-=wgj6h97Ro6oQcOq5YTG0JcKRLN0CtXgYCW_Ci6OSzL5NA@mail.gmail.com>
Subject: Re: [PATCH] vfs: Add AT_EMPTY_PATH_NOCHECK as unchecked AT_EMPTY_PATH
To: Mateusz Guzik <mjguzik@gmail.com>
Cc: Xi Ruoyao <xry111@xry111.site>, Christian Brauner <brauner@kernel.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Alejandro Colomar <alx@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@loongson.cn>, 
	Xuerui Wang <kernel@xen0n.name>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Icenowy Zheng <uwu@icenowy.me>, linux-fsdevel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sat, 22 Jun 2024 at 14:25, Mateusz Guzik <mjguzik@gmail.com> wrote:
>
> +cc Linus

Thanks.

> To sum up the problem: stat and statx met with "" + AT_EMPTY_PATH have
> more work to do than fstat and its hypotethical statx counterpart:
> - buf alloc/free for the path
> - userspace access (very painful on x86_64 + SMAP)
> - lockref acquire/release

Yes. That LOOKUP_EMPTY_NOCHECK is *not* the fix.

I do think that we should make AT_EMPTY_PATH with a NULL path
"JustWork(tm)", because the stupid "look if the pathname is empty" is
horrible.

But moving that check into getname() is *NOT* the right answer,
because by the time you get to getname(), you have already lost.

There's a very real reason why vfs_fstatat() catches this empty case
early, and never goes to filename lookup at all. You don't want to
generate a 'struct path' from the 'int fd', because you want to never
get anywhere close to that path, and instead only ever need a 'struct
fd' that can be looked up much more cheaply (particularly if not in a
threaded environment).

So the short-cut in vfs_fstatat() to never get a pathname is
disgusting - people should have used 'fstat()' - but it's _important_
disgusting.

This thing that tries to short-circuit things at the path level is too late.

              Linus
