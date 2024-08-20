Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF16873176
	for <loongarch@lists.linux.dev>; Tue, 20 Aug 2024 16:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724170200; cv=none; b=cm+mOJwkeqPrT2kkkD4G/Q/sMqOOXIZ57HBwNGbCypENyNgBc6pmBOva56HB3TB4B9jIx33i9jHw1u3GZA1cn+OfbLDZY1FLw9VGrwOo4ox0YTO3Rtjn7Hh5g58yGzT2jO9Ou49hGzmnzLGm9TIlo89w5nJF3sHg/saq+BTLLDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724170200; c=relaxed/simple;
	bh=76CU3DXa2htQCQYyYNMdPjM63LK5xgyJkPKcC8EhkC4=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=o2J9YKTSTLyKXj1/R82GPlPBTEJcTKgG71aEA0HwB/feNfu2QyF8NHtBd5rovPlr7zyGPT0BDPj0Vi1Ics9I1vNQowBtCQCcwdxjeBsCA9TF9JrR3gFD9IT9WH3EVyyE6TdtlEiNEwOVZeSlwr7Y6UCrtbQoG2PSydngd6UgxP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IBRsS6As; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IBRsS6As"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2d3e6fd744fso775464a91.3
        for <loongarch@lists.linux.dev>; Tue, 20 Aug 2024 09:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724170198; x=1724774998; darn=lists.linux.dev;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=76CU3DXa2htQCQYyYNMdPjM63LK5xgyJkPKcC8EhkC4=;
        b=IBRsS6As4duKS9NIFHiHpJitIMWjs3t/M01Z23JLh7qnLwqctuFAXGNz3tZbyyH5Xc
         zWpaAqFsD3yLjXs5QaQz5fQ/V7WowvW7yUnbbhHU3w7Yg0wmIb0UPLLuVBK5Mqm/r50U
         46LOlfAkerCwkvYa3uDkRAesEkSrgDikQKay6RjvZjiDoWJ2t0WV0bwGAXl0S6Ieaf4Q
         1XGEREes04QnlWJ8Z5AonDAjbaBykgiGQ8t5Rj9ZQ13EtpavgeHAX8vahAeVg/l6+xPs
         b5MxRmGMq5z3y5ni8mLScTydt5GCt/IZjCUQH+68VTsJMrXrtId1gQZLTQ3H2x5jCgxq
         m/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724170198; x=1724774998;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=76CU3DXa2htQCQYyYNMdPjM63LK5xgyJkPKcC8EhkC4=;
        b=kwfB3xeXniesQZTQ7nwd+ZF7zvmNAiSQdaWyTl9B6m2/y4FU6uTpGNtssDOhDHD5dR
         2cLeUPnd223sZZXRz/ix/fZnatGiE3JIZc5jHfOuF24o4s6ik8cwE0dLddTRjT5BCZj0
         fw0co54PyI7BwRWe6D8qHw3kCKzDDyvvRZI44HFENDr83NiA0fjJMDnstO1vRpKyfIhP
         /SenVmV6LFhlEHSyWdv/pceEL9anYDBaHmtDCi9DVhyc3Cd92ZXlRZU5RTaGrB6h1iu3
         LYL/J3Ick+Wl+mYdBHdv5zNjTpE5CJ88PXPBEE96m4p4NaiY2+OleWxNMWd8M3+Njzd+
         vORg==
X-Forwarded-Encrypted: i=1; AJvYcCVzEdeY+62dd6aF5MyIpjWynW6bijnzrt+fI2NTJ3RDeu2q0ZRuWc1cjylJl/vN53TiTgxU/Yc5zen3EZkp+HmXZ8CE6SRfiw4j
X-Gm-Message-State: AOJu0YwykBuH1oiy+6+q43is/EiIkeXiOTlKoNQRsrjHRo4FwU3YUnj7
	dJFCt0aOhJbUK5WhkSrjffAWLY9WnOytTCRjUb53t469SkTsBGhM
X-Google-Smtp-Source: AGHT+IFJD/CxUVfTsobk3FcI3v/Qr6i/vGLQx4S4hkaUDHJhZiLKb22uVEB3WkdlfmQ+jEMEiJHYag==
X-Received: by 2002:a17:90a:ca08:b0:2c9:863c:604 with SMTP id 98e67ed59e1d1-2d3e1d654afmr9553761a91.3.1724170198028;
        Tue, 20 Aug 2024 09:09:58 -0700 (PDT)
Received: from smtpclient.apple (v133-130-115-230.a046.g.tyo1.static.cnode.io. [133.130.115.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d3e3c7502csm9592276a91.40.2024.08.20.09.09.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Aug 2024 09:09:57 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: It is correct to introduce new sys calls to stable versions?
From: Miao Wang <shankerwangmiao@gmail.com>
In-Reply-To: <ZsSwnPfyOvdSBMOC@1wt.eu>
Date: Wed, 21 Aug 2024 00:09:41 +0800
Cc: Willy Tarreau <w@1wt.eu>,
 Xi Ruoyao <xry111@xry111.site>,
 Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev,
 Sasha Levin <sashal@kernel.org>,
 stable@vger.kernel.org,
 WANG Xuerui <kernel@xen0n.name>,
 linux-api@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <46C6EB05-1AA2-42BF-82BF-3B99CCA57439@gmail.com>
References: <DF762B6F-360A-4C0C-8C85-55686417209B@gmail.com>
 <2024082057-coherence-lethargy-3513@gregkh>
 <D19DB99F-B5D9-49A6-BCF8-A5980A9BC1A0@gmail.com>
 <2024082027-deskbound-rumbling-b96f@gregkh> <ZsSwnPfyOvdSBMOC@1wt.eu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3776.700.51)



> 2024=E5=B9=B48=E6=9C=8820=E6=97=A5 23:05=EF=BC=8CWilly Tarreau =
<w@1wt.eu> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Tue, Aug 20, 2024 at 10:00:35PM +0800, Greg Kroah-Hartman wrote:
>> On Tue, Aug 20, 2024 at 09:49:59PM +0800, Miao Wang wrote:
>>> Hi,
>>>=20
>>>> 2024?8?20? 21:36,Greg Kroah-Hartman <gregkh@linuxfoundation.org> =
??:
>>>>=20
>>>> On Tue, Aug 20, 2024 at 09:19:04PM +0800, Miao Wang wrote:
>>>>> Hi, Greg
>>>>>=20
>>>>> I saw you have included commit 7697a0fe0154 ("LoongArch: Define
>>>>> __ARCH_WANT_NEW_STAT in unistd.h") in your stable trees, which
>>>>> actually introduced new sys calls newfstatat and fstat to =
Loongarch.
>>>>=20
>>>> See the documentation in that commit for why it was done.
>>>=20
>>> Thanks for your explanation. I totally understand the necessity of
>>> re-introducing thees two syscalls. I just wonder whether there is =
any
>>> limitation on what can be included in to the stable trees. If there
>>> was no limitation, theoretically, I could also maintain a so-called
>>> stable tree by applying all the patches from torvalds' tree, except
>>> those that bumps the version number. Apparently such a "stable" tree
>>> is far from stable.
>>=20
>> Or you could do the opposite, something that I have seen vendors do, =
and
>> just bump the kernel version number to try to "claim" they updated =
their
>> kernel to a more secure one (i.e. one that fixed loads of known =
issues),
>> but they really didn't.
>=20
> Some of those who do that don't even notice what they're missing. I've
> seen some BSP kernels "forward-ported" by merging the next bunch of
> stable versions, trying to fix rejects by hand with the usual ratio of
> failures, but after that since that version is part of the history, =
it's
> impossible to figure what's really missing or not. Some people don't =
seem
> to realize that *merging* code can actually result in *removing* =
fixes.
> So they don't even need cheat on their versions, they're genuinely
> believing they're OK... which is worse!
>=20
> Willy

Thank you all for sharing experiences with vendors messing up kernel
version numbers.

However, my original question is whether it is expected to include new
syscalls in kernel stable tree. According to the document =
"stable-kernel-
rules", if I'm interpreting it correctly, I expect only bug fixes and =
small
driver enhancements from stable releases. I understand the patch in =
question
is actually introducing new syscalls, which is beyond my expectation. So =
I
wonder the consideration of including this patch in stable releases.

Cheers,

Miao Wang

