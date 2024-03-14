Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7955C61E
	for <loongarch@lists.linux.dev>; Thu, 14 Mar 2024 07:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710400785; cv=none; b=GuPPWbG95WBt+DtAUKN2MQf8u4uTieEJZU9w8Ltz8/YqiBgSXcVw1jAKj1wOFx3OSRGj/o1tAN4IMvphSHsY8vliDdeToFBKSr7dl/yk4AajnDvlGflPo2jI1bSoke125qhO2ocuiKQF81GcgD7lQ8VTVjnvQ36jptRsBOdyzMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710400785; c=relaxed/simple;
	bh=ojH9YgZdQsTdhM/5DOp0sR2SpKlzVwEvHTXac3BNoo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MprnRJu+t3BYSxy8gBJrvIk62fnMjPIVHSIHpyeJRrgpYgBQRM5JDS9CaD2MpwoR6pssRBg1XW4+kJjW5rNt83m6fqcgSaQpu7Yo8bgNdFlTzn0WjEtTwjMZ6iFrie25BsXL0+W+BnBG0qnFNlsgeRQiq2AQ3biVBFIEFeut1tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ioSDAg9t; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ioSDAg9t"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-4d36c20d0f7so914143e0c.0
        for <loongarch@lists.linux.dev>; Thu, 14 Mar 2024 00:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710400782; x=1711005582; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ojH9YgZdQsTdhM/5DOp0sR2SpKlzVwEvHTXac3BNoo4=;
        b=ioSDAg9tsJ4w76jCEm7pRxq3fFkUl7BQKp+GVEkAUk7Mt6TRHH722nH3vDZ/MN0hoJ
         8V8+B82Dm52eF65WZuHj79NVrQ3IXVjGJ1KZXMEMN3wok7YhdVhcdsTGSr6s3jxLiL8P
         BFTQEki1ExFQg5/rUPFG6c5zpc9o02WUBTop45owYOicPgUEvivg7Mkuo4Q/aHEBJIXw
         BnD9nTvWPC7bsn8dyNqYDGaSVvlihbIsb1/kGvde4M/hjRJyU2YHhFOwL1cTbDOgGu4m
         0neCMd/OXPPgDamtiLhFgsHh+nTsrvLeJCjUqPYwdqtJjtmaGqgLKhFFCVdjaWERigHO
         1Uag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710400782; x=1711005582;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojH9YgZdQsTdhM/5DOp0sR2SpKlzVwEvHTXac3BNoo4=;
        b=svndQWvoSniktELdwXSUYlSRaFuTtbhCxiVUyOSB71OtJheEg/XPTvUaMZVho8RzHQ
         SNrZ+IvTKeCEhGmqJ2UESK6n/QvVRf4nLWCZ/BoW9RT6OLiFuwwxjQAAUIJkNuJM3wUf
         eSo+l6qPkt7gLsYqUacsRSGCOVCtYAu/7mx/wLrUn2kf2epRhOJm3CE2g40xqsiflbO4
         n9yxNvDEsSCPKYkGN5WaYUlzHQypKg+nzZnhaf31w3y44qhv8bPOVl3MwWGbvJW7UZeG
         pZle5P5pgjJHLPnHjBjUBFkbLGFBy5PEkc395nr+j+en2m2ihczQfCWSoCubH1NYT86u
         tJPg==
X-Forwarded-Encrypted: i=1; AJvYcCXXEY+E7XxPFCyRRCAmiuY29MtpQkwiWJ5zBajtis/irdcC5VktgLMePSfVDKv3+Ywyt4JMQbgi6CPtoljnAdDqWLn1E32JM5/7
X-Gm-Message-State: AOJu0YxDFLEkafUb3bQN1gDwGNiqaUGTSp7DPWiJ4fWsuqsQdY8yHomq
	2qAUh0YR+bLpALtDMevX2YFm4nif196X14frTkKIEGQr6fEvqdGjFzYLch66D/hofaq+VMCFjG+
	BEJ2ZJXgNzCBqvfH751cN7b/v9lVDYXvmRfJD1Q==
X-Google-Smtp-Source: AGHT+IEu7MNUInwIY97dleYnWeWXfcA+5F5T/ApvKi6n0MwxHEqr/RR8abTAy2/zINbSlyHB23weCyfflgDg+RLDw2Y=
X-Received: by 2002:a05:6122:1296:b0:4b9:e8bd:3b2 with SMTP id
 i22-20020a056122129600b004b9e8bd03b2mr431224vkp.2.1710400782181; Thu, 14 Mar
 2024 00:19:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240312170309.2546362-1-linux@roeck-us.net>
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 14 Mar 2024 12:49:30 +0530
Message-ID: <CA+G9fYsHhTLw3c1Eg-L6G3H2g7-mPf9zdR+hKDCV10RhHk5vhg@mail.gmail.com>
Subject: Re: [PATCH 00/14] Add support for suppressing warning backtraces
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>, 
	Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Kees Cook <keescook@chromium.org>, 
	Daniel Diaz <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>, 
	Arthur Grillo <arthurgrillo@riseup.net>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Maxime Ripard <mripard@kernel.org>, 
	=?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
	kunit-dev@googlegroups.com, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
	loongarch@lists.linux.dev, netdev@lists.linux.dev, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Mar 2024 at 22:33, Guenter Roeck <linux@roeck-us.net> wrote:

<trim>

> This series is based on the RFC patch and subsequent discussion at
> https://patchwork.kernel.org/project/linux-kselftest/patch/02546e59-1afe-4b08-ba81-d94f3b691c9a@moroto.mountain/
> and offers a more comprehensive solution of the problem discussed there.

Thanks for the patchset.
This patch series applied on top of Linux next and tested.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>


--
Linaro LKFT
https://lkft.linaro.org
