Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E88C33B9DA2
	for <loongarch@lists.linux.dev>; Tue, 14 Apr 2026 10:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776161027; cv=pass; b=j8I1HuFFHTQII8CSd2n9FTh34mu1fF2eyTS61d79XeknW1PlbhCaMvm9uLzY5M8fFUAM9iu8TreoCCYa5kjDXluT6GLYxGZLH9W/1Pttmya3Ike4bu6IR1DwzH7m2Fix9596tAXVtkxjJ+esJ2GPE0f1TTxLHxlWFPpOVsd4bWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776161027; c=relaxed/simple;
	bh=NGw3vq0gGYgbZs3WougDNYv0+luak2LML/PW+q8OygE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l/Ct4IwHDceOEWN6btww9nrf2nokBqwx39+3EZUHTsusSJUdgQwWhlAcp242l2tCGY0q6yUN3SY+o4lITyWHK6SmV9ZXsHaK44HumWMhfMhC0lIm2SrvVW3ShbngjbV5fbaz5JQmpPn/ePfs0j73jeJQNFGR3wV+h5m1mzhiGv0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pt1vU13I; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pt1vU13I"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-127337e3870so826727c88.2
        for <loongarch@lists.linux.dev>; Tue, 14 Apr 2026 03:03:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776161025; cv=none;
        d=google.com; s=arc-20240605;
        b=S/EnXodIQlL8iUG1nXjLo3EiYGdZBXReukTl9SgKeXkGPIrjI+J7J66SkkxIJrvJlt
         2bSOggzfZDLci8/ww3JmM0galmrZSZhCHSvjrGUJXoeAK1q2zuVr063TV9A0CM9kN4c2
         A+P/JyoqDuyMZHxc/RT1dKF+2fIW3J1HM1J+zMgbPYLS1PeaMvOEup6HVvlljHBKsBIQ
         pLXUTu5XYD6kGTi/7VmCkfQUoPranIynQuiaI1OkpSEREFswTcG9ZpC/ofeZYRl0kV8i
         6Cvm97Hs4GrHt6NEmjDoaZKNnI/+pNOFN1uBXZdLL4AUVZ4D+tz2glMFXhFg++Whts3M
         9eSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NGw3vq0gGYgbZs3WougDNYv0+luak2LML/PW+q8OygE=;
        fh=d8SxEDuQtntyBmN2yF0zHxXgg2uRijpxxmH7i4dIZhs=;
        b=MBp1/VMwByqERNqbfm8ATD3Su7rGahdcP6QpcrRJVe9BVeR9YizBEGeDJr2BNTHg2Z
         uRmqB3JFoAY8rqklMJHt9DPR/uVXHELKsjN2NK6nCISeLBOv99PBC4r88GPANyGW8lns
         KeSbaVnL3BoWh/XcM0F7Orm8i2jTxfuXTjJijBCrojwz6lqzeq4Ed/TbIPdZJTuBzLqw
         yci3rEjGgjrEehkntmmF0ZofpfkIIOEFEGa5hzK9q2TIec+hXVKzulG0xulcniEg1Hjs
         CaqlCz7QQJ9Wq75O/pcNGLIgDwUi4hFrNYw3O/inkgzNrcxxOkZoNFv5zvMyFsUYbuzk
         O49w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776161025; x=1776765825; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGw3vq0gGYgbZs3WougDNYv0+luak2LML/PW+q8OygE=;
        b=Pt1vU13IvWkq9O+z2VoyKVxiSdAXIUxuwrPd4bAhABULlx/KQjMT8OUp4N1gVIh9BY
         z7XxXPoexaLQyOPwHNhns0lJdRLZmq2auS8ZrDGEgW8tS4aU5sh9plgEeL//zGQPD7tu
         u1xZTbQOORqD4I2987RtI6lF9zIN33Q9mPDbmPQ1eI7DZOWyhl0zrhyA7Sai6sMH5Iiw
         IL39zmb8Ednlj7/GzwBdDODfgHdE2F7vdbvKSBfjwBMpWhEKYayjm6/SIi6Ro0mg/HNE
         MyndtMW4nuJUtCXuZvDjN0pRBP+cgAlAt9UrWSnV7eF7ygrRxZU94fC/Gr7aZNrqdSaH
         x+zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776161025; x=1776765825;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NGw3vq0gGYgbZs3WougDNYv0+luak2LML/PW+q8OygE=;
        b=SF9TOcG0lJGaRKbde/xuPPgW/YG/6Qcv3+F6LhcQgkF080juUdsl1izv/n+VJTxpDN
         VlNK4aqWyG+ZVjGUvraZccacWUziNA/KS8ykyYAd02bO14O/iHK7Dt2X5DOGuan8QG8V
         vVMjITn+f3kP035gNeUp8/PPrKVUKSI2/k56zbVqfPFz9AzK4Ky7F6W+MRxe/UlYY9k+
         Io9+9Wi7oXlebNGExszd3iaBxjLK023S9WlTLpjEKn9llPBo3IAo+26EcLasValMZrgj
         kdpKpM+nvYUdYIA4LOEk/C7Nqg3Ojb/xK3Whin0bHUDkn8xbLtkRHc1x3vPp/3drxYLG
         Z9eQ==
X-Forwarded-Encrypted: i=1; AFNElJ81shxiLEhx024gvTwjF44EuYkhden0jsrDlQNwBNRJM+kn5oxpUt4qTxJN5oPloae3+uYoKafi6mY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyDgNDREGI+7bnb8H59nKXBiDYxHhqZgxjZ7xKHdYRNZDTbllF9
	yylp6OHkvK7x9eu6WEIc8/52vbz7pivSPOtWkXX0xoj6VEs9Y19rEMRVaqxnSD/z5mbaW8s23GG
	bvDWm0dbJT5TbmIiLW+xKmxR7npWQ7JA=
X-Gm-Gg: AeBDieswlCi2Ci1eP6das+mT1C9Hwmu30mBD7e1L/PgfzekUWiJ35cRvL90y1admnS3
	/cVq8n74Ev1DhP+y1v5rUkufVk/0VTHDQwvTG5m6rfXxfpxjWNSg3y1PGnHzdfY+wSLt2bFu1bA
	jHI4VoYf9tCob80Vrg8xz2ccKUFR4v7TlgibAAd/LKWg3p+hF9FU8py3MQfcO1XWxNgiaZkYiRu
	gKkMTErpzyigVIAHKnoi5EhD2LVpyBKJ94Ezu/FWAWPeDVIqCLDenjnRDmDkTd4ee7j+MlbYDue
	Oc+mA6b11d2jJOE88R1NG9LX0DbX9vdMazuNO0EbvdSz/n2wbbiLZgUeLpvAiT6v7A40DpTq5T2
	IE1SdKSiOjgULHZNZFWI6r6Y=
X-Received: by 2002:a05:7300:6da6:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2d58966b77cmr4005329eec.3.1776161024897; Tue, 14 Apr 2026
 03:03:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260414080500.320095-1-r@hev.cc>
In-Reply-To: <20260414080500.320095-1-r@hev.cc>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Apr 2026 12:03:31 +0200
X-Gm-Features: AQROBzC466LTvnRS_A9FBMV0x9gLQuJNVW1COdEXUuheC7eprPjxu95Elog66iQ
Message-ID: <CANiq72=c2wniA2piByZNUVzSUA2YPhRPKBq7e_bBP-69Lo+wCw@mail.gmail.com>
Subject: Re: [PATCH] perf build: Add clang and rust target flags for loongarch
To: WANG Rui <r@hev.cc>, Dmitrii Dolgov <9erthalion6@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev, 
	loongarch@lists.linux.dev, Haiyong Sun <sunhaiyong@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 14, 2026 at 10:05=E2=80=AFAM WANG Rui <r@hev.cc> wrote:
>
> From: Haiyong Sun <sunhaiyong@loongson.cn>
>
> Add missing CLANG_TARGET_FLAGS_loongarch and RUST_TARGET_FLAGS_loongarch
> so that perf can be built with clang and enable rust cross compilation.
>
> Signed-off-by: Haiyong Sun <sunhaiyong@loongson.cn>
> Signed-off-by: WANG Rui <r@hev.cc>

FWIW, sounds good. I guess the commit that added the list should have
had it to begin with? Cc Dmitrii.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
