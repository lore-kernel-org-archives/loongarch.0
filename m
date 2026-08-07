Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EDB36A02F
	for <loongarch@lists.linux.dev>; Fri,  7 Aug 2026 23:21:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786144899; cv=pass; b=EyWdrxgy7mY/kRqJQyKxCBuSLwr3FYwfA0QZXaJk+tgfQ29kAO02KcOP2IBiWv847fsWkSJnMzC6i8swLyIDQioN3ny7NCxriXhLyb92rbahKzW30rO5qRYYodVrAsv8rrDJQUCPQ82x1wLBEbI+Nregj4ggPNmokBoJIAwQXek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786144899; c=relaxed/simple;
	bh=epJUB5gTvpGGdpSohqeoBRjyUtDyaQ2iclsISq4UJxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E1p97V4ByXFAf+7jeA81CyXpyWWTU+qGr7bsOKUA9t4u9y4cM4V1Y8bTn2vCF0Wx7kuLcDtBN5bSDU727vvYPIxpghXTf4sHITYXlve8WkVr2eyWmXG1kKMsvYl8g214OOatf/+Y1LA8DW05iuZ40AfI5EDsfbfa6bJDXxlm20s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B+8YrfCw; arc=pass smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B+8YrfCw"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84a32ff53fcso14796b3a.0
        for <loongarch@lists.linux.dev>; Fri, 07 Aug 2026 16:21:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786144897; cv=none;
        d=google.com; s=arc-20260327;
        b=GjYCkAajkcE6eLTiASVk5UbEC499O5NoLOLoKfS5ohPfj6AREhPBt6E598dsiOXrIJ
         TJwqYzpw8yM5vNgs1XEyHM+Ao9vqD9jWnWE8nbg1C9QlUc04kCOVjxCDvg6i9Y97UzaR
         F+lQKBKDnKrpSF30Aglf9uNBvhsghMuYNqjbfXH385u2RqeWyncb1CKy0FyckPg58nws
         6Wsn9VWcgN5xpBbW/loULLUxY3q7K/APK3tJN/n0bxpLCd8cZdLooTMUh7uLfV61kDO4
         iBRNTk8EejwsSPXorfM6aTD6c6/1/P6nvGnmni/9cP6B8T/ppUWFbypZ1kXdxrKlkmj0
         FQ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=epJUB5gTvpGGdpSohqeoBRjyUtDyaQ2iclsISq4UJxw=;
        fh=ctkwlb2GZgBEyxfZ4tGmCmu93AeV8PKc+RbVmgEYfKQ=;
        b=Jyu2xUujW81xcNUP5cISpELl/LfIo/1WmKnQ1osAl84xTBqW3OYcl0v8e+ABN8wOK0
         9zuaTIqbUZST+h4LM+SSxqTxo2PpA7M0L24Rj3efi7szFJcteAjAxvHO35gqbCd4P2bD
         pW60daBYkclkgqNIZI8Z1xu0QJeDD7fEDBrJUn40qfB3OcGBdEL04ukRaLvDMmgOB7CU
         OLRo/7U+yQgfuYzZex9Vwvb+eZ3RNN8URf18A4/nOuADDR2wwx2DhD66gAyG/J/4rgT/
         CveFLNyu/rzA+D1hR/vSpDnc/mLBtPjgasjgBr+G7oAe45O7qdAHrCth16S7NycZmSmK
         GdJw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786144897; x=1786749697; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=epJUB5gTvpGGdpSohqeoBRjyUtDyaQ2iclsISq4UJxw=;
        b=B+8YrfCwxCCYgxKgdVhYF4zF2ObEQLdcHQqoQaz16AjPD0ftiTh4rd18VsKK7yhqRI
         7jjKKiOH12Dok40Hce52vGbUqnCPq37IDX5gc/44XFp6Ahld1rr9qY8r3K03wZ6eSGJl
         4BIKTjJb7/9p0wHYclbfYe6jVxqoWZ1QdTD6MdoKtRNofttHe2aFXRotj3nnPVXqJaXp
         xLL+IUZkAoI4OBhm9D65v0rebxTCP2/tJ4xzsafVQkO9HF3XNpsku7Lf6+aLTWJZ8mb5
         nuKHlV707jZOQ8PEOxmVKzsB6pbKt6V9RoJtdXsNWphgou7XXrYY6Vbqzy7LzBcNQ5+L
         tUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786144897; x=1786749697;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=epJUB5gTvpGGdpSohqeoBRjyUtDyaQ2iclsISq4UJxw=;
        b=dSWVvB9bOLfXvSHjEYMhsJx95I5gQxjHSDfZgCBmwTj5gRQpUJq7oWJcPLHRhcOfH6
         RnkiPCXNtGHq0E8GWrCUIlaB62fpsH8KBXdu4vB0AMkz5oCgEWIjrPDpcXKFcwdyK7ku
         o7IqyPf6F5ndidV/72i3CJVmmh3/ztNKc9n5vNksYTkFnnmWPTdJF0v6MxsPhlU21qvN
         Fq1IokxQIAEOiXoukK4/OFK4p7FRR0oD8BziLgHprQBdHWTgcbw5nOgN6U9AQzNS80vl
         uQawgl1NmoeBuNmUVcsLKoFMRuNhT2L65aZMrHPl6fVxZo5OAYjI81S3u/V2br+ggiTX
         bygw==
X-Forwarded-Encrypted: i=1; AHgh+RrwWeA3VdCxWhTbNF1VZ1by2ZNHFG2HYEjE49ZYjgur8R1pFB3qUKnXiefdyKdmtnMLRoGwawgW/gA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4vkK0b1593zC8E06eyxD40w4JxQbiXpS5te2qqWYpVIZKAzdF
	69VwiUKgcT+A30nr93ke0LcM40LML+LJ7On1b1cYVTx8j6wIBq7igWPx6C3tWRBBBRVl7+ck+WF
	KAcL3D6RsiN+VFXP15e/fZYn6HUTRH7s=
X-Gm-Gg: AR+sD10N4UjWUnPd3hThme/3dUERrG8pRI7r8u/DANi5/Zzt/C08pTHPWpWtcpjWCeO
	Bl0LpL8mI5TV3QGEzCpXOMbkL6PRH8hiqy7wttDgWpS7gWB2dwNPHeL9LUsNq51vbZ2bPnzIVsg
	Ofap2YZRUcjr8D4W8/hPRyCpnfteDB1UyjUto0e+se7Llb13aDcG7sB5iMSLqv1XMrZMaNIH1c6
	RnBln7IlMbR9crcc+FMZ+JnJYkqgvrZec0VcX0zf/FdgDre04beZLRayba8Q2dgZZ6auXkPtDa6
	uEhYiWvHCH7FuxntUQWRiBXmXO8Xb6t0gtUcZNGNoubBKxkQ8PRaKAZdpMyANTGq71EaxVdFTy5
	PUydcdD0YO/RzAHYFp9D1yADDhLeEQOwHAxT/AqcI/EjEwlP1g//v4o5CRTsA
X-Received: by 2002:a05:6a20:2589:b0:3bf:99ea:aeb2 with SMTP id
 adf61e73a8af0-3cb8646fe2bmr20610739637.4.1786144897090; Fri, 07 Aug 2026
 16:21:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260807221429.155946-1-ojeda@kernel.org> <20260808.074341.1056015191905819805.tomo@flapping.org>
In-Reply-To: <20260808.074341.1056015191905819805.tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 8 Aug 2026 01:21:23 +0200
X-Gm-Features: AUfX_mzt6ITrqPgmG06xYNP1noGEoKAQULArIyU1uaz5hrUcXcfHz6eFuH5RVl8
Message-ID: <CANiq72n4=fz=JNKY0Jdm8BnLa=RmHB2B7s0bO47YTJ7hygqBZg@mail.gmail.com>
Subject: Re: [PATCH] rust: bug: fix `dead_code` warning in `warn_on!`
To: FUJITA Tomonori <tomo@flapping.org>
Cc: ojeda@kernel.org, arnd@arndb.de, krzk@kernel.org, 
	alexandre.belloni@bootlin.com, linusw@kernel.org, chenhuacai@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, fustini@kernel.org, 
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, kernel@xen0n.name, 
	loongarch@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 8, 2026 at 12:43=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org>=
 wrote:
>
> I sent a fix for this bug a few days ago:
>
> https://lore.kernel.org/all/20260801024841.786664-1-tomo@flapping.org/

Ah, right, sorry! I also saw another one with `rusttest` for arm64 and
riscv64. Did you see that one? We probably need a `cfg(testlib)`
split.

Cheers,
Miguel
