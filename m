Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC8F37CD45
	for <loongarch@lists.linux.dev>; Sat,  8 Aug 2026 19:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786218064; cv=pass; b=hP5KrgPjoIUUflpsITmHqMyeUE+3/KNKQW9dteUr5bmADen2kgILE3+ENYSl36ZPlgsHbr2bX+YgqijbIPta5BjcIwtmoMUcqpjM3REJqebkBDy+gpZJSLaDPW8YkgzD9Dl8NLa+XlIkkkdAvHlbD+BC+1P6MjsfNLgSYrauKSs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786218064; c=relaxed/simple;
	bh=WKjEzMmiO0snanv+t+uNfhShpP5xYF0n9oP12NeJ3Ok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fRKtAtfi0Eds+pxhyrfFotq1FQ0R8iHM/ly0evdcvCg6MmEa0Zywk6QkxLiDiuYYDKeHYSWlhQe5TnABa2pThhMfom5E0rznL0UhggAq0I2eYoKPz4/GNBvlCoHV5reSBPe1XDHEzcyrFp99Zg0kAjMhOahWtiVkvI73wqw5kQU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ewQCIlTS; arc=pass smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ewQCIlTS"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-381f03d7be0so155158a91.1
        for <loongarch@lists.linux.dev>; Sat, 08 Aug 2026 12:41:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786218063; cv=none;
        d=google.com; s=arc-20260327;
        b=jDozcByEVG3T2FyhjDudmmdhCtRJ8IWbHDbCFs5xOYJQ4tmYDmWruN3ZpsLQzDUdPt
         EoESMhHVOsigcb7IQuQbYCY6Vcy5nMkrn9OCtgzM8Rp9jnlZGc/GdTJSCTHA8x1evYc+
         qI/yTsaR529yHa/eQvKeCQR1v6ND5l1UZgqJ4RfkGQrDUs5XdIcw7z+psIvEp0J2BoHn
         oTfCC/AZQCKWk3KXy/NQVmeaJl2Mh8Yezjuki5ufx8Vz1cYNSGZZyyEhV+UJa6bCTU2Q
         pM1vEjay1Z0g8imcaFZpf/s/GlONXvFfUcEBp176H/P/HikkvN/ZSjvwMjZ8vhvG8pXj
         7Tsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WKjEzMmiO0snanv+t+uNfhShpP5xYF0n9oP12NeJ3Ok=;
        fh=NjOuOJy7/5zK7FnmuZ3E9jOHkaUvpuTMKRiXkXOXO6s=;
        b=bXkurOC68Y6jNXabRZsiFSbWxkpsULdCJnjiM+e4A8VCW18DCinj4Pd6mD1gsv+Eot
         OmBYv4hlWf8Dc6EfKbpD/4X2fMv/XxGZox6LYbH05O3osmbSLAx+GpyEDmgvuvRu47tJ
         UI6rKComyS1Vurlu/IEJqHiR9VqImRVy3aqtZVEwhqrvtNOfFe2fqknmSxYX6hiip0et
         9xC6RfpPrl9khfQTszKXxkVLgohGcfmF9piJ1DjzuroW2/fpP/oyYqgpbJIsPb2PrbGB
         uax9VWGSXCddComBCfNJgwhj/ppG7725BeUO3RffhxZyFE5Pnd2FczpUGO9dnznTq/rO
         rH8A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786218063; x=1786822863; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WKjEzMmiO0snanv+t+uNfhShpP5xYF0n9oP12NeJ3Ok=;
        b=ewQCIlTSu/mzZps1D1hYLIjnV0Q/ErSWUt6bwbw3FAncXFlc07Tstc9nuoDMGixcCe
         eM/Q83nz82D+A5F41SpZ4N2t1DvRHr3NUFgHkpWw41AHCxcWDCMD0rP53IJTxzNRBiL3
         JWmXxpHUlQHfvsYJb1Tag6wN9Jdx0eCwUxHYFpENt1LgedNjTIC4J67VgqjjXkASU/2G
         WT3jdek0oNdjD2X9q4ibypHUilvOZKtWAyMXx67yjXzN85LpC6bgt7viRsFjKmjTOFDU
         uiDcaaFV9fvSNFgKl9NBDZfrFdQHrzjL6LRMVlrGOBYQRYZMApwNu/N2vX3OlW72ysja
         vU6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786218063; x=1786822863;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WKjEzMmiO0snanv+t+uNfhShpP5xYF0n9oP12NeJ3Ok=;
        b=HeBk1N3mulXgY4jbIawWF9clS7uo7TBjXq9VPvXlwqvF4vuV8VYTT+Phav2S489GJ8
         DrZCTyF2xVrN/kw7Y/b8lGU/EA99v0AHmn+Dz6Dezj6YslVG6Yc3zz6TJ5GkYPOrpj24
         DwS2rrrT7Nkvcc9DHTkiF3Rz/VLNg+1WtpR10haFFiBt0tbF9fxvS6ZLt3u9ubcpJptP
         VuUwt0KWSMZUamxFN2UDyVFYAF9vJhK87OnT4mOe54x8hJAQKeFkOxSfaBbgVDDlszCb
         THob2w7SkflEK4rdp53My5L5BTSafrP4LLSXx6vqc9q0jH00X5qnQ30mIHQ0YD2jbRZ4
         S02g==
X-Forwarded-Encrypted: i=1; AHgh+RpVKuoEax3JX9GHVIRoy5J9SNndDGjqZL8uWN+fMQbq89HU5YnCe9PulurxvNPfxKjHFk9/loTcaaM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzaSgpxlX9e4zssFfdlJpjNau2NGj68SltrCW8y7QzGDR2LGo90
	vYzAG033vyiXrw3JTjtdZT91B9iowt/Gk5uwKPKqfyW9jzcHHex57SLb9NTJ3ZUWrYPUdSIWswM
	F1wLoIi3Gc2l9L1VZltRQZIublqc8Nao=
X-Gm-Gg: AR+sD13eA2S6l0tqmJtxwABNzU4/xAdFq7v6+wNciivUYf7eOtZxkHegnv2fJ7ZsFrh
	e1H53kt79WTgWWu9XFz6MrsInHb2O0ijNIPhcCHnO0jQOXGgZX3NvwrL5ZVp46CPH/BlYaMPqH1
	05mYPyMpd4JMShakRgYVORSk/U3qIsxYFRu1/qg2v/Q+lltQnT4FbcXN1ggfoYKkUeMnV0AMGfb
	rEKr8yP3EfnxlZSFN8jnP7/zGMyYO8NTuwbF6bVi6N/troX4lfsfZ4IIZGtdq5n9NCUtI+v6SN4
	e0plo+EXvpSR5DOy5vP4LoVDLtWe52EXzs7LK+1t7D9aqEeZa6YJnYyQYiDYVYrHz+DRPTOeB8q
	bpt9Kfw8gSNoQ16BsQU6ol8080AVUGv8ypH/8FWcsmM3uqkmoGHUzYNfUUeaG
X-Received: by 2002:a17:902:ec8a:b0:2c9:ed4a:c3a4 with SMTP id
 d9443c01a7336-2d0ca1658f2mr275615635ad.0.1786218062739; Sat, 08 Aug 2026
 12:41:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260807221429.155946-1-ojeda@kernel.org> <20260808.074341.1056015191905819805.tomo@flapping.org>
 <CANiq72n4=fz=JNKY0Jdm8BnLa=RmHB2B7s0bO47YTJ7hygqBZg@mail.gmail.com> <20260808.143013.1251068388254615351.tomo@flapping.org>
In-Reply-To: <20260808.143013.1251068388254615351.tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 8 Aug 2026 21:40:49 +0200
X-Gm-Features: AUfX_myY729uYjJW5IhCmENfsQg8ijuPS9VLtcEZjSqkZiEXciXEvujLP3Jq8gQ
Message-ID: <CANiq72m70uWCRFnhs3axdymSTGCirBrYAvKh2BiT0xqW2j_3jg@mail.gmail.com>
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

On Sat, Aug 8, 2026 at 7:30=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org> =
wrote:
>
> Is this the one you saw?

Yeah, exactly.

> I posted a `cfg(testlib)` split for it:
>
> https://lore.kernel.org/all/20260808022608.1125174-1-tomo@flapping.org/

Thanks! It seems good to me.

> While at it, a question: what is `rusttest` meant to cover when
> `ARCH=3D` is not the host's?

`rusttest` is meant to run tests on the host, regardless of the target.

There aren't many tests there nowadays, since most of them moved to
the actual kernel when we got support for that, but we can still do
there things like testing proc macros.

We could also use it for more things in the future, perhaps...

Cheers,
Miguel
