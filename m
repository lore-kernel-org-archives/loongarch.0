Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 832AF7080D
	for <loongarch@lists.linux.dev>; Thu,  3 Sep 2026 23:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788476687; cv=pass; b=Noi8Y/IDxTQDvd+bWFkr1TRtMothkY6LgrsCTNpyETVym7Dgsbmu2U6MK3i+B+N6WRo5TMH01uqlK8YlJZZVVFbKwSGBU44ZbUPuHv1IReKMyhKIbRn3IVP2izldXrf2AwrktfB/oL+KvtwKgLCWWIcY0Y82LiCV8X6Y4G3I0dM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788476687; c=relaxed/simple;
	bh=pogpfGLRbc8pFVw8T9oRRZ9VzHI74RwYUpxF7mDhYvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bFWguCVHPdXlk3uVAOmPQ915MrCSmOfIWvBf0c17lFFQv5tQhEhNlhV5M3rdSWhomMGhoueA0gVSyhTgObN1h97oER00T7hCLzncE0BqxUOzJ1IUXzaNm5kOVwnVd6WiESTvobd5wIvTKv88tqOzGOp65W+gmtdf8MzEYjORt2A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dz84e9yD; arc=pass smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dz84e9yD"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-396555b8c7cso44241a91.3
        for <loongarch@lists.linux.dev>; Thu, 03 Sep 2026 16:04:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788476686; cv=none;
        d=google.com; s=arc-20260327;
        b=YgDxBnmrlq8HxEAXq2YL1k6T82PGhdaqjHFFCKefhmd50TTHMqzl9QXLgVg44785/u
         eid9HNewU7Xy2ERCwLRc5JQISWFXQ8nfVzA7C6rH6ZETc33RT3kIxNfIsJn7Oep2xEiN
         GowcYhUTg+XSA5Y5UXeVt6niwIH1oNSPyqFMB/TSyY/Uxn2B1b4v/yPTmKAMgGI2jMr6
         hXMUz8OqRy9oSLsD5w1Z3/MOggwnCm5PUHjDvzWJMNSi60pkCQV3Ejjf/q30hKSHubZY
         R1/3AdhSF4yUM3daUfA0+2RP3iKJnPu6hpBXKZreIpDA8fWsO1pQssG1Tj4HQ1sxGcQG
         y8wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z9+DSqCT6KWQiTogvQpx/z89XAxQVuXIiB2Wq5kzB7c=;
        fh=ePD//91TQbE9i+i9O+UN22dXwx392Xwqmsh38bmrvAI=;
        b=UyKIIBi8di0/I+alrPZzndnP2SaAPZgudvn1PvQYhTUTX38vGF7M089PxApPVyUNaT
         x9QrX2cfSpNSeBsL7fUBg55vID6+9l1gjOHaUoRLd6yaeKBDnnFPm+D7yFJIq/KmIyQs
         ZAmD0RTuhVAwQ99s4YpCy7TXti6pW3GokBh5StgZomF9b9gsLVqPu159aDchclKcmlh2
         5zMAOiTlX5QD+FxthIgKFHyXC7yUspnqfARjmbhFXmESB5QCIiiY2enDKyQtpKrjlpjM
         qxHtaw41/mM3tbra1uEk0VUnr75pnUd8QtrVEK5kIgvTiL6VP1gKeYlBspi80bQL58g9
         VW9A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788476686; x=1789081486; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z9+DSqCT6KWQiTogvQpx/z89XAxQVuXIiB2Wq5kzB7c=;
        b=Dz84e9yDu0c99guwAhfsh6piZqdvrh9zBV0Lw4bNxAv4vToSVpTvEkRnMiUpEYz67h
         RlmOqV2r4jgvzs04ZIa1Wlirf+mq86xnB6RdfgA+FsHuKQ7/aa7xV0jNSbNyXcYeFgMh
         MEevonc2HcKxT6AqWLVnDx3flNe69Ga1LNwNSCrS/exZ6qMYn92W/BdriYlrMi+BUdBb
         op0Q9PsOqdnMD0E7zNugpng0H0bHWWOzNBd+11k/7NZMqRVCv1shVNrDf4dxri/CNhbu
         vW4LfY3T5gOyaduA6tpZHFlTY6Ry8hThWoG8JjIQFMAfYNakuA3uK6GubmSyTx5U0D4c
         zDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788476686; x=1789081486;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z9+DSqCT6KWQiTogvQpx/z89XAxQVuXIiB2Wq5kzB7c=;
        b=J26e2SX/yc61DMK9suDuXZTx9N7y8MKwXare9JxJ8ow2kWS6Xdc1YY8nxngNEFCOL2
         Pah9fxulDZ9w145cAysdgDkxylKXb8pNU1iS3xKSoG6R/0HStpQ9ZUUo3jacp5KnSo9l
         FJeBgyA1ptv+/s21PiQJS1KeSDSKRWrOB/ySiyYi0iQ/qwtoFfF+mL4A70YOwBDbfiDu
         k6ClvYVP6TLcawQv82W3zvMIk8VHaJ01x0v8+A7XW6EjH9OhL0GZfugcdIzDdWDrol5b
         oujH80Ow+LApWupdHVhPchYqzTJRdvzU7UfmUu3+P4XzdP4ad2jFm5oVR59I4lXvIQOB
         UJ5g==
X-Forwarded-Encrypted: i=1; AKwUvBxGMnjDf9zWYce+pivoMSZNRdaBEJM/v2zCOz/HTSjMzmuLWNHUEc4uy6lvsv1eqh0narb6yIRvIXw=@lists.linux.dev
X-Gm-Message-State: AFuF++lbs7wgt50oe2RyPXNmNm2FKGStWNUclFwkBv6+MLpNlPunbiFn
	88RWhsAiUmHkY57opr8/Ck8gWOra9kTzqFBPrw1U9YOLZdIZLIk5ufQYJ/OrvUzcSqgDax9KrxN
	WMGrAwvATBJyHgphqWlK2v5sd6BTaSxg=
X-Gm-Gg: AYBFou38Li2e1R7l9noqhssDfXTB4z47eVBtovmXPCbXSOQnAS1hzYO/nrfyEKyCufQ
	7np87By7wt92HP+V9+qKlehmi5mivCmQEI63IQcAg0cZ6lyv3BDUDxN8p9kOMSb6dVSkBJFxkp5
	4VMKi2DYrKktb/w+XO6KTbZIdiE5SuX7kbenuHmEUtU9XROMoYyKR3zJiv+bj1bo2f9mlsB6wxK
	yVSdOwzy2lpP43DOB9fyRTlNFRLqgeNavVi7amcclcjeI1IDKkYcTPuMO8rONbv/t7ERpL7/yyw
	AV2J4IskJdSi/vgtzds/zNE27ngYdIBYxes0jTaHCcKKFxAOpNdPche1dNUHCOZYxF03Ld3GFpK
	dvK0o8/IZIM/4kSKZKcz8/VKrm7XBC4vm0ZYYQDVlkJ3k+9WGw5tHzgdzPocU
X-Received: by 2002:a17:90b:2243:b0:395:4df3:8800 with SMTP id
 98e67ed59e1d1-39b25edbf98mr1644924a91.0.1788476685819; Thu, 03 Sep 2026
 16:04:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260903-loongarch-disable-rust-with-kasan-v1-1-1813d3c4baad@kernel.org>
In-Reply-To: <20260903-loongarch-disable-rust-with-kasan-v1-1-1813d3c4baad@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 4 Sep 2026 01:04:33 +0200
X-Gm-Features: AcwNN1WBHo70zP4o1hDHlopgVQa-be7SFUVqk9JfwqC4a4f9ZIU4Rbq4K5LMntU
Message-ID: <CANiq72=-6CGi5d=sxd82mp347skPGxK_xH+UNt_dUUD_rKdFiw@mail.gmail.com>
Subject: Re: [PATCH] loongarch: Do not select HAVE_RUST when KASAN is enabled
To: Nathan Chancellor <nathan@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	WANG Rui <wangrui@loongson.cn>, Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 3, 2026 at 10:12=E2=80=AFPM Nathan Chancellor <nathan@kernel.or=
g> wrote:
>
> After commit 2625480a1bf7 ("hardening: Default randstruct off with rust
> for better allmodconfig support"), which allows Rust to be enabled for
> allmodconfig, ARCH=3Dloongarch allmodconfig starts failing with:
>
>   error: kernel-address sanitizer is not supported for this target
>
>   error: aborting due to 1 previous error
>
>   make[4]: *** [rust/Makefile:741: rust/core.o] Error 1
>
> For the same reason as commit 84a0f7caafc6 ("ARM: Do not select
> HAVE_RUST when KASAN is enabled"), do not select HAVE_RUST when KASAN is
> enabled until the loongarch64-unknown-none-softfloat target in rustc
> supports KASAN.
>
> Fixes: 90868ff9cade ("LoongArch: Enable initial Rust support")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Sounds good to me -- if LoongArch gives their Acked-by, then I can
take it in the rust-fixes PR I will send soon; otherwise, this can go
through their tree or Kbuild's I guess.

Thanks!

Cheers,
Miguel
