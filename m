Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20163202C22
	for <loongarch@lists.linux.dev>; Sat, 15 Mar 2025 14:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742050546; cv=none; b=kmOVZWBj/5HrrYnq2YPwgrQVtP0mFNZLZtPmcQW0MI5plC3aUUBuqD6nZ6RuCQGbmFRg8rYZPi0F0XIq6TWie0MOG/edbhwrEIZ0Stwck/SJSIfAsmA18r228TmmnKnumvv80mk7TjqrtuGr/al26wf5Pbyo0m2Y4Nis/2kgjdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742050546; c=relaxed/simple;
	bh=XA99tfLBp8bXT73QYWUaMhUBMUYYGtyNQMBwQmFvmFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 Cc:Content-Type; b=W3LsdxnlrXtD7ZnwiiOKpyCiFYgvsfCCi4trWkAxj+09oEr5ags4+ysXS/FvIOYTKF+8LWzjWoRmLn98t9mGD93KHqEG3mI5ckVgDS3Shxs7Hz4kcGykV8Fa3QvQVMqt5/kopTcVrpKjKibNczoTqxc1YeBBpgxVtI3JgI2YZIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YIb11YxC; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIb11YxC"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2239aa5da08so59353595ad.3
        for <loongarch@lists.linux.dev>; Sat, 15 Mar 2025 07:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742050543; x=1742655343; darn=lists.linux.dev;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XA99tfLBp8bXT73QYWUaMhUBMUYYGtyNQMBwQmFvmFg=;
        b=YIb11YxC/j9uHnU+p4z4qyzCf5QnfVP6F5mrVsLxWv6XsUqC9hNMOyYMSsxPW8KvH7
         b0SI9etNdOMqheGri5TvDnwSfN9yQxL44IpStSrYQhFyOqAPWRlC0lN9c+d+kNzhUU/m
         dFzZ4EWsyisUUWwflUCIvSzTEX/iMgI95BfG6GhCLx//N8yvDmxlyMfMkQGlMCy0Szpt
         lKtbY3UQdbAb4IdEkpDg44qoNbt1kNz3qM+fOAllS30wXMQ+Nv8fkv14VjqECuzkwBVB
         pXv2zlr8YYYAdG3Lj5EoHH7xsLl0rzQ30+4dBl7b8PwkXiPjXzMnx7yAlEDBcF1xp9NK
         /RTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742050543; x=1742655343;
        h=cc:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XA99tfLBp8bXT73QYWUaMhUBMUYYGtyNQMBwQmFvmFg=;
        b=WVSaR1+Ul2SEY+6l938AOvnS9NuP8NqcB6pUEbaNDJ0U4DLcvkcxM5/16cvb8fW1qK
         9kM2YI8VtpccSUZ6JRL5Nya8Yv6QCzL9T5fisDngqwtSSDLhA/TjRmC2GP8vg74FJwY3
         t8HshSu2cDyPAUI2EPSftmn5MU7JCUngujIyvJV/mk4OjMyGKu4LkTf/VetCErdS9Kuc
         StwyVhFq6TtEoohRI/mIm/mypZyQti9bcDVa41oW8JpXPK4rAgJTsvMpSgC7BSWNCOhd
         YOr70pYlDgIY2qY1Gt6wkSz42Tj9MIZwjMl7t1v45O11gNV1bF/C79Agn4vhziB6Tsw9
         EfqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3y+2ItD9qiVPEQs+SetdUHy6pR3ffAmm2T0G79HkCyi90lJj7sJe2Mb+dTUJ0DuY+BzCr5kPn9A0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+udoi4LICpE2LE08qRY0+S4pZUWcbmiwdOtA1Z4k717cYr8oc
	JqAyEGtTT3EH7ifIDqp8s6faVIpbGkY3YVZtMIrHJar5rCoTJqqc+5X6B9l9rCB1RRILJFHAVu9
	wyvk9ET3e29xfFYQZWMK767H9OGw=
X-Gm-Gg: ASbGncuGqwS650oo1brG6s7NKjQ4Ny2PZa0jMzVB3ziRF1MbnswJvwplcL1zfXtMufp
	EC6L7SY9SyntDezNQ5r/jo1bcwNMzBCqMKituSJSoUfEbs04nAdi02IzX3Ivr3zVhep3P6uaKWk
	wF44OfAJluW2t4s7K1iDmtvYY=
X-Received: by 2002:a17:90b:2e44:b0:2f9:d9fe:e72e with SMTP id
 98e67ed59e1d1-30151cc2490mt7920211a91.16.1742050543260; Sat, 15 Mar 2025
 07:55:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250306185124.3147510-1-rppt@kernel.org> <20250306185124.3147510-11-rppt@kernel.org>
 <cee346ec-5fa5-4d0b-987b-413ee585dbaa@sirena.org.uk> <Z9CyRHewqfZlmgIo@shell.armlinux.org.uk>
 <Z9ErEBuMMvd6i2n9@kernel.org>
In-Reply-To: <Z9ErEBuMMvd6i2n9@kernel.org>
From: DiTBho Down in The Bunny hole <downinthebunnyhole@gmail.com>
Date: Sat, 15 Mar 2025 15:55:33 +0100
X-Gm-Features: AQ5f1Jrmv7KQRCuWBIo_vXTI9aIDRsZr_EQ5uQHAURWeudjXpiSlHPWiANvw4jg
Message-ID: <CAAZ8i80e6CsD1Y36-sVrVs4QPB-82J1gPOeDvHa_+sQtfUpMtQ@mail.gmail.com>
Subject: Soekris crypto 1411, where to find ?
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc <linux-parisc@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	x86@kernel.org
Content-Type: text/plain; charset="UTF-8"

hi
this is probably not the right place to ask, but I've been searching
eBay and similar places for 2 years and haven't found one yet.
I support older MIPS hardware and need to find a Soekris crypto 1411
miniPCI module or two, to add VPN acceleration.

Anyone have an idea where to buy it?

Soekris company went out of business years ago.

Let me know.
D.
