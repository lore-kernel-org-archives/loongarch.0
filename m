Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EA9194A53
	for <loongarch@lists.linux.dev>; Tue, 28 Jan 2025 09:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738058072; cv=none; b=HnmEgquUwQbuS7SIWUnYcREBcRkCm7v+GX183TGcE2sMYRKuv5Nuygd2g1xeN6uCjC3JgL+AfQTojobRWiGJPxKMtB7IvOkGSMFHEr5wlXfPiicoU0rMz0qe+M/Ykr3bqfw2aoHLuvfWgC2sKrAsljtdsWd2y/Unhnh2vqFR5Nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738058072; c=relaxed/simple;
	bh=FPePabk/CawmYtjxc49K3o8+mGDA+BGGFjBPF4RxiFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J7WkD0trU4h10Fjz611dHOu8xAbpL8+6r6t/0chQh1EEp/Yp7aEztuGdTmDgc6CuZtleBWdPtaZTgQee6tXpQXV7mduqGZJSEFQcMguFXQuT+9TRWNUMGk4ea9BJjFTZgrQ54fuirdLlNQRhvuTIAGEEPxUs3n/jN/wkSM/9RtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=KWqVF7dH; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="KWqVF7dH"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-467b086e0easo30224471cf.1
        for <loongarch@lists.linux.dev>; Tue, 28 Jan 2025 01:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1738058068; x=1738662868; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UT6fh/OGztjfB30ZqU/6P5ZMuVzYdE7FWai8h7IXxAo=;
        b=KWqVF7dHWLkiWubMZFGQjur7Ccfd3H763czYSU8QZRtyHSjWDs+tvV0VL+tinBHTx3
         HQp9RW6uwh7hV+vcvjb9PL1U7zRpqPnDOY4s4U5Gwx3SVLN7nAy5h65l/O6qiAvL4oD2
         y9CnWhgPHfSk7Qmb+r0lIO1B1nE9XflD++okx5uy6sIxVNdZgmozfJyQbi7g6De72m+d
         nvNQZu6ugqUgZWloialG8EMM11vUaN6r3kzNscb8l2vF1yILhbs5TErlpk95Vch5QleV
         fHI6bf3Jack21j0TB0dkHOUzGoxgPGNeD1RdaqkhQtHLheNtTkRi5kzXSxWjcziSFIx1
         VReA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738058068; x=1738662868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UT6fh/OGztjfB30ZqU/6P5ZMuVzYdE7FWai8h7IXxAo=;
        b=f7CK+gq7jFJXhrr8wNmCqyVONILxAp3AmTlNdi5hkLaPzYiOruz0T1yXXqYfgDLiHG
         r7l1wLJIcLL8+mU3+0ieCuAKGDbyXY0ZTszPPJiICgeeYp8BwraZiBDJjvRXpQKPZLPh
         PDjapODWPFOU8Vxtd62dCvy4DSnRw6g7omX09r07zJmb0XAZAwiwM2y4Hm9WvVBf03MM
         5qzUMnrif6hK6U3UVcwGj8w90qJkBebfzqkcGp1Hrlm87qCsQ1X40DZjnjbH+p3qECeF
         OPqI9hzjwQq1bAERh+rgv5wuEQhrhBUVZgs3ZwfsmhQyisxHAYqLtum0voP1/ut3rW9f
         sIzw==
X-Forwarded-Encrypted: i=1; AJvYcCWz1z2DH/FporOvkG6JRyxOsiIu43T4RY2NLUUcDL6ZqOP17TvKGd6hpkuOnjBkkiKa4lkQU4s68kg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzx20xATq4up7kKrzJ0fVUaUysGupwwIoKD1nSOcewPec0I5YRL
	6jGuwuaT43GT8o/+vw2K92bajHoj57ASvDh+FK06z2ktnjyPLxT5f40OoxiqJ5w=
X-Gm-Gg: ASbGnct66DR5pxdwdxdbblJDqqDAaQTJSzp69eaYlkS4MrMZuQI00zKHwHMALnYJZgJ
	D02/h+CKjgVyvcS/Wnmdoet7I7Eax5oA/Qrx8zirPcTEZybLRYAdkiJP3f4HIiwufkEs45RsU/m
	Q2nuaJb0Xd2eD2MqJIeknEEJMBc/1yK6imzOcnUCSaCcC6A5Qrq0rZn3Q6ggqqNt1jXOJ2uUQbn
	Gwp3GhKNBObhpeJY3bUxU7Okeoca4RRI2WuXx/7VMxKfUnjGeV3wOmV4vjx+fVXVfVbNb0Z+KOx
	h7b+TjMt4CUwUA==
X-Google-Smtp-Source: AGHT+IGV+OpCd7Hvs+nB+4OG7Cxl3LZM7EelUp6+FcxX+Vwa4e/poqVIz0K5OozWR5jB2U8pf3CPhQ==
X-Received: by 2002:a05:6214:d48:b0:6d8:b2f2:bccf with SMTP id 6a1803df08f44-6e1b2140d52mr533422786d6.1.1738058068200;
        Tue, 28 Jan 2025 01:54:28 -0800 (PST)
Received: from localhost ([2603:7000:c01:2716:da5e:d3ff:fee7:26e7])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6e20525ad5fsm43317186d6.57.2025.01.28.01.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 01:54:27 -0800 (PST)
Date: Tue, 28 Jan 2025 04:54:26 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
To: Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Vitaly Wool <vitaly.wool@konsulko.com>,
	Miaohe Lin <linmiaohe@huawei.com>, Nhat Pham <nphamcs@gmail.com>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 2/2] mm: z3fold: remove z3fold
Message-ID: <20250128095426.GA691108@cmpxchg.org>
References: <Z5gdpStVzlM_fRLT@google.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5gdpStVzlM_fRLT@google.com>

On Mon, Jan 27, 2025 at 11:58:29PM +0000, Yosry Ahmed wrote:
> Z3fold has been marked as deprecated for 2 cycles and no one complained,
> as expected. As there are no known users, remove the code now.
> 
> Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>

Acked-by: Johannes Weiner <hannes@cmpxchg.org>
