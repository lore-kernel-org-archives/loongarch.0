Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC18C1F4C8A
	for <loongarch@lists.linux.dev>; Thu, 13 Mar 2025 21:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741903070; cv=none; b=RGRnXHrzk8CnbsnsnEm1yb30iwmB42uXXBc/eo6CHUFtsSst/Lu8a3+JNkOVWZeTr78gpWEnbgLFxQ5xNsuoqe643yfexv9JBmDQhINISImIIz7OblTV9yWzYTGBE/unUbNHLOhSHo3vlxu3m+NOnJ8RuquiAkVS0AcH7jYuEFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741903070; c=relaxed/simple;
	bh=wkxUnKWC2Yc4q9NrIhzQPhasKzAvDUxfsq4o/HmyFUI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=i5aZipFlaTkmyGZGwJDCueR06m8bYlralzRT3RhSpaWI8lfvJPjCL24Fk6YORzIUFI/sCeMolTilz29AV4hU2wKbwgEah3MESL8MRR/4k+JMUsIyDEqOqCj5H8S5v53j4c1YSYGlm10vz1DufvmV/verOnUYjPBA9rdNp90NXR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WcU7+jan; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WcU7+jan"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso1301878f8f.2
        for <loongarch@lists.linux.dev>; Thu, 13 Mar 2025 14:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741903067; x=1742507867; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3M8X2QWckUY8UVMTuD9mXen2KDDE46RLeaO6zC7dTM=;
        b=WcU7+janit/tfcZLEtXbqchn5D41Qvc+Arcqd5s242dIAoo0G8k3D4f9oezrvEnqsP
         PO5gzR7qzUiqeeswwXE+yEu+NS9CC6ii12SNUR1qGX+r3tvYCTvTldBQ0hRhIqOJGdLZ
         rcZGRroAwcwVdWmd7HwsRpc8PL9sdRkfHXUmGF/Jt6vulsG2ovEM+dfhPgOmZLF7qlzf
         dwxES3OFeud8EN5GOTIXwVVEGAFNKiooEzPX/v2w/r8gmT/c05x3Dni8oMwyRnHMhvjB
         nLj/fjS9ugfaEDOpLh+gKUEXZl3fLrsjBgBX+YsH/oKMOybzk4lRn4u+oYuxT8JLcDBw
         VHaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741903067; x=1742507867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f3M8X2QWckUY8UVMTuD9mXen2KDDE46RLeaO6zC7dTM=;
        b=OEZFUIDcotLNG7YtB75miVGcnAfsuHV/1bxJ9rr9Cg7/yrASLjcztgJVAV0sIJHK4G
         dCbM8epztzhLP31wl7DrNGr4EUsKmCPXB/zEEYYJSp8UbPH6mhdNk/V3geId6ynYBY90
         X4EsDAGRd7vlLrWiBvsVrhr/e7Obbf1DArxjXBa5HHiPkpJj3W7W7AwkgZBYzforqJES
         XOA1fsG3nmSHSxwj8iQSA/u+ZVw65bx8GtbYjx5SQ95d1Wee0/uo/A0P0zzoKNAfngF9
         PUJyJoy9FEIfNQUhGu8kK0h6vZsR7kx7pxypLLnrug/PjNCGncWsweu6euRGSpBOSsxn
         xUlA==
X-Forwarded-Encrypted: i=1; AJvYcCXxBb0SWDFbT5NC5Bmjd1b/UoXgQVOpBp157uYdVLPPzAAgSIEW0a/5SfLkptJx7m23EdQfTMTk3Os=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx82xHRijO0NP8lrb1dDlQhLAw7hCSCwKU96FLx3fuQXc+S1OJN
	RrpTSkyNHMzChyKJJJ8GTZXbEKajPbhCs0rO+DCIk9SGQoRLQQfe
X-Gm-Gg: ASbGncttIL9v3HSstYso6ytW5qlqG0iR1OmE5bp2NdiXSrH4hQE9qOgkVpwLMKmxW98
	mjavzIWpJfH9fprcZ6QYC+M3K90JA7ge6s8ggitO3QgT9m+ELb/MsaoAxh2bxSfGGsWwjPGv7co
	qWtKfGJgAVgWteQoeCkEjWMWQ0brIo3/nHLwg0k6zMBkrpqkftK1BLGtNF9/COXpdl+WWUAHCFH
	dVpTBryqqoLJIJXH1TMlWcCdaPQhNpRvLoTA3/L6eqLmSod7vGo0+J5FaUVo+Yenf5DPA5cDcUM
	qYzUo0xFCofUs8Y3FYD71IJN7aqfIhdRg/ir/c8f+k3V3Q45yL7Ndioksjv/bmAgPbkzp836n7b
	vLmt+NkU=
X-Google-Smtp-Source: AGHT+IHH24pd+b5gL54NDaWwuWMDj9OGu+oF3QMwmPgdGW9oUb+b+U4WJtKrTTYmfKHOFBN/QTa6kg==
X-Received: by 2002:a05:6000:154b:b0:391:412b:e22b with SMTP id ffacd0b85a97d-396c200fc00mr1190205f8f.18.1741903066987;
        Thu, 13 Mar 2025 14:57:46 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c83b6e92sm3443876f8f.38.2025.03.13.14.57.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 14:57:46 -0700 (PDT)
Date: Thu, 13 Mar 2025 21:57:44 +0000
From: David Laight <david.laight.linux@gmail.com>
To: WangYuli <wangyuli@uniontech.com>
Cc: chenhuacai@kernel.org, kernel@xen0n.name, yangtiezhu@loongson.cn,
 maobibo@loongson.cn, guoweikang.kernel@gmail.com, agordeev@linux.ibm.com,
 ast@kernel.org, usamaarif642@gmail.com, jiaxun.yang@flygoat.com,
 loongarch@lists.linux.dev, linux-kernel@vger.kernel.org,
 zhanjun@uniontech.com, niecheng1@uniontech.com, chenlinxuan@uniontech.com,
 donmor3000@hotmail.com, Wentao Guan <guanwentao@uniontech.com>
Subject: Re: [PATCH] LoongArch: Fix use of logical '&&' with constant
 operand
Message-ID: <20250313215744.69a976aa@pumpkin>
In-Reply-To: <EEBE30D1ACFF646F+20250304105246.766404-1-wangyuli@uniontech.com>
References: <EEBE30D1ACFF646F+20250304105246.766404-1-wangyuli@uniontech.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue,  4 Mar 2025 18:52:46 +0800
WangYuli <wangyuli@uniontech.com> wrote:

> Fix follow error with clang-19:
> 
> arch/loongarch/kernel/setup.c:335:40: error: use of logical '&&' with constant operand [-Werror,-Wconstant-logical-operand]
>   335 |         if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) && CONFIG_CMDLINE[0]) {
>       |                                               ^  ~~~~~~~~~~~~~~~~~
> arch/loongarch/kernel/setup.c:335:40: note: use '&' for a bitwise operation
>   335 |         if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) && CONFIG_CMDLINE[0]) {
>       |                                               ^~
>       |                                               &
> arch/loongarch/kernel/setup.c:335:40: note: remove constant to silence this warning
>   335 |         if (IS_ENABLED(CONFIG_CMDLINE_EXTEND) && CONFIG_CMDLINE[0]) {
>       |                                               ^~~~~~~~~~~~~~~~~~~~
> 1 error generated.

Isn't that just 'an error too far' ?

There is nothing really wrong with compile-time constants in conditionals.
The kernel is full of them.

Why not just disable the warning?

	David
