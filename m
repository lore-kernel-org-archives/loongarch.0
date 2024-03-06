Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394B9604A7
	for <loongarch@lists.linux.dev>; Wed,  6 Mar 2024 18:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709749458; cv=none; b=aKDiVR8G3Ekfo2hwZ7ywfkfzPTzxlpYFJ2y2v1fTtEfVUbqo8GxX/VvpEYNKILFSGyHgEtOAqPw5ZIUy0xUcVwnAugElvReSdeiHeddDnNyOvLNmbmS8RInzK7w2Kl8U/so+vFmE89J22iaoU4Vc2qB6C/ks6BBCfLlXPOJvSuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709749458; c=relaxed/simple;
	bh=WytS40ZdmsM5zwjaJMMr9w3erghzLSkCQiyje+s3eGY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=chel+otxsaMoIZ6KBGFbowI5DJQ+U1jGuCc3doI2fpqxR6n8Ha1AOTbbyfQT2tAVRSm8p3K+h9oDFPl1x9tEWxyROXKPOTYOWTF0hlRqVOplQ6Y2LbUyqty0geVWUG2mSZnmOyiNPT/cqIQu0yFi0Sn3BFm5rfiMWPuqxertCPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YZ68jhxo; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YZ68jhxo"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-5e42b4bbfa4so5238113a12.1
        for <loongarch@lists.linux.dev>; Wed, 06 Mar 2024 10:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709749456; x=1710354256; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RWWS4LnVP/asDNzm/6wkKWnD1LdXMDQVgVaviFZ4aPg=;
        b=YZ68jhxoMyYh6DPrDkp8BJJaBk7CYBVbV4cOF7jYWslLyRB6eODNn3e5R+XDCR1HhM
         J4FJL57HjlFxStJ+MB8jLPatFWuygbkG0i+tTraeLTX1mk2ISdDXY+qbp33tukJV5OSH
         hr285q8PjZoBKlqY1NwqgorC79CrKpmLPz/aBlka1tA7U/rA23lMlLJWQsvvoJiLwMby
         YbuYpUVFu8c/B3r6s0fJVtDNZWock2YnPmwcRF+2LcjzS9tzzmWGZn352xqhRPz3Jrbi
         ZvTQhSbourAEJ/QDUK9V6nYDud6cwCbfYL08dcvlZ0wIHbrmE2DTj/lwURRlzLAg+HVN
         29Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709749456; x=1710354256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RWWS4LnVP/asDNzm/6wkKWnD1LdXMDQVgVaviFZ4aPg=;
        b=Rn1Je1hXm0VH5ZjaY+FkBpMA8gh0UQISJZeUy4PehXxspeaNoE9AXytS8kDfSofAed
         /CHDxbBicbacscoS/QV9mRZDsjTI8imLLpK+xo0UGBu/lOwC0tE0fQOM3HgdGOKqqeFU
         93pppnYxEBHK9t4y2Iq5TfagY5Mh92a1WkVTWWrFeQXo5Y8+8JC7MwSiTtg6zmiglPyG
         W0Vsp5a/UtQ/EX9kRIP4AQq6z61i+hlHbFRmbr6qx6LOn1cDMnhIQEXRwo9rYr5pg+Hm
         jAi3DHZbTrf7PXqfC015mj2gZz9VXtacVOyxsM6NMBWu1I/2OaV74GxSycg1vcPKJfa1
         hfqw==
X-Forwarded-Encrypted: i=1; AJvYcCV0sWycamN1Tjd3holF+1RwtY51bGgo3ECWcisyDxwAtoVBfvhk0pwTDpRIM575WzMqGMkXZhlAuM4R5Qrdk8Er2TBHSgLR2+6i
X-Gm-Message-State: AOJu0Yz8cYfhaB14gvDzcyReXNNHfogBh6b1A3QJeDdDcOiIO5JgBE7k
	oXI46dIaTx1aAOVVoSUmSLXDopmb1CvXXgPJpXKozog2L74AxTz6iYlHamb3oyrNKYmipHgw+I8
	jlFBgGTm+6H6NieMr87o1p4fpRKgvoQx5hHr46w==
X-Google-Smtp-Source: AGHT+IHKPEqxOppMA9uKtWnzKAyEDN9QbdCsWR4IDnjuRlBVf+wG6gTH/NYYdjq2Jeob5XWC2zp4Hl1RW9kYPP1CSp8=
X-Received: by 2002:a17:90a:8986:b0:29a:c886:243e with SMTP id
 v6-20020a17090a898600b0029ac886243emr14404213pjn.39.1709749456443; Wed, 06
 Mar 2024 10:24:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240305184033.425294-1-linux@roeck-us.net>
In-Reply-To: <20240305184033.425294-1-linux@roeck-us.net>
From: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Date: Wed, 6 Mar 2024 12:24:05 -0600
Message-ID: <CAEUSe79fwDAhTdAD3OecCAw=LRzajxA3b-B2r8YtVDPeH7LCtA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] Add support for suppressing warning backtraces
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Kees Cook <keescook@chromium.org>, 
	David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>, 
	Brendan Higgins <brendan.higgins@linux.dev>, Naresh Kamboju <naresh.kamboju@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Maxime Ripard <mripard@kernel.org>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, 
	linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello!

On Tue, 5 Mar 2024 at 12:40, Guenter Roeck <linux@roeck-us.net> wrote:
> Some unit tests intentionally trigger warning backtraces by passing bad
> parameters to kernel API functions. Such unit tests typically check the
> return value from such calls, not the existence of the warning backtrace.
>
> Such intentionally generated warning backtraces are neither desirable
> nor useful for a number of reasons.
> - They can result in overlooked real problems.
> - A warning that suddenly starts to show up in unit tests needs to be
>   investigated and has to be marked to be ignored, for example by
>   adjusting filter scripts. Such filters are ad-hoc because there is
>   no real standard format for warnings. On top of that, such filter
>   scripts would require constant maintenance.
>
> One option to address problem would be to add messages such as "expected
> warning backtraces start / end here" to the kernel log.  However, that
> would again require filter scripts, it might result in missing real
> problematic warning backtraces triggered while the test is running, and
> the irrelevant backtrace(s) would still clog the kernel log.
>
> Solve the problem by providing a means to identify and suppress specific
> warning backtraces while executing test code. Support suppressing multipl=
e
> backtraces while at the same time limiting changes to generic code to the
> absolute minimum. Architecture specific changes are kept at minimum by
> retaining function names only if both CONFIG_DEBUG_BUGVERBOSE and
> CONFIG_KUNIT are enabled.
>
> The first patch of the series introduces the necessary infrastructure.
> The second patch marks the warning message in drm_calc_scale() in the DRM
> subsystem as intentional where warranted. This patch is intended to serve
> as an example for the use of the functionality introduced with this serie=
s.
> The last three patches in the series introduce the necessary architecture
> specific changes for x86, arm64, and loongarch.
>
> This series is based on the RFC patch and subsequent discussion at
> https://patchwork.kernel.org/project/linux-kselftest/patch/02546e59-1afe-=
4b08-ba81-d94f3b691c9a@moroto.mountain/
> and offers a more comprehensive solution of the problem discussed there.
>
> Checkpatch note:
>   Remaining checkpatch errors and warnings were deliberately ignored.
>   Some are triggered by matching coding style or by comments interpreted
>   as code, others by assembler macros which are disliked by checkpatch.
>   Suggestions for improvements are welcome.
>
> Some questions:
>
> - Is the general approach promising ? If not, are there other possible
>   solutions ?
> - Function pointers are only added to the __bug_table section if both
>   CONFIG_KUNIT and CONFIG_DEBUG_BUGVERBOSE are enabled. This avoids image
>   size increases if CONFIG_KUNIT=3Dn. Downside is slightly more complex
>   architecture specific assembler code. If function pointers were always
>   added to the __bug_table section, vmlinux image size would increase by
>   approximately 0.6-0.7%. Is the increased complexity in assembler code
>   worth the reduced image size ? I think so, but I would like to hear
>   other opinions.
> - There are additional possibilities associated with storing the bug
>   function name in the __bug_table section. It could be independent of
>   KUNIT, it could be a configuration flag, and/or it could be used to
>   display the name of the offending function in BUG/WARN messages.
>   Is any of those of interest ?

Thank you SO very much for this work! This is very much appreciated!
We run into these warnings at LKFT all the time, and making sure that
the noise doesn't drown the relevant signal is very important.

Greetings!

Daniel D=C3=ADaz
daniel.diaz@linaro.org
