Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B0630CB2F
	for <loongarch@lists.linux.dev>; Thu, 18 Sep 2025 19:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758225501; cv=none; b=QSWF7YfjLQU/PuqdlnFCirC0Okut4TgwZg7+Us0cW0Xycqz4sgCObatrV8u+nMlDgUxhCzVeDCAd03WztmpC8blhkKwdFKnyH99BCtsBMs0vCpG06VxiyLW+0Y3WVM8hefzQC9QT+lGKk9DQfGOv7nByq/QSEo2qnbsQVJaNf/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758225501; c=relaxed/simple;
	bh=hrTKVKMuOKbLilzSA+VEl+XSSF0VIocT2KvCzkuRjcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iOuqnDzSzpuJaC2/tq+y/FVG5rKb8WjzIN7s8k88xlpScA+wM1je5TtdYOY4AuOLC3ckdBwc2YsTrIZzjCCzDtgBCrLnz9bA4sWYvwoCUfPxAVZx+VBynuY8+SXJO83FCAmd7tB8gxpxztlxZvROovMR53HusW/fkMh9wId1MPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RL93mThJ; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RL93mThJ"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-62fa062a1abso2194508a12.2
        for <loongarch@lists.linux.dev>; Thu, 18 Sep 2025 12:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758225496; x=1758830296; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9McvDjxp1cOQ8m8DQ7zr8KAOkClRv+R613f7KwPZqLk=;
        b=RL93mThJU8b7zEA77/e343JwHhgIcIDild9DqYLWBT/2lWPAJVQm9qnxHV0U+SDcZD
         eesu0m2kmelXZUsnL85EarFKrW9l4TVVKSvdyJwLqaM84tSgwMVfqJgsgS3CdeItaJF4
         TfO+R3wRqmVZi/tWwKDfIAQKThvc2zj0n0HOoESh0asjaEucL2Lpm6NId8EY1SGubUVt
         41VIy2OYhFUe8FYG7C/T6ly506C05X+Gsggc2ihjWsJwP+igo5sefV28jhVnVwlkl1pT
         T0zSNv+8yOxccrNR9/CkGhHVoy6lAIxTZ1fV+iVYe7OU+EFdvtFa7ZCV4U9SxmuCP17/
         4zYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758225496; x=1758830296;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9McvDjxp1cOQ8m8DQ7zr8KAOkClRv+R613f7KwPZqLk=;
        b=nE+g02ofQu0SvcIEPkPST5qdObnFBZ/K5CZ9/p0o4YnW5kGS78oJH7KHEgRPgaTUt8
         dTsTZpeQhz/GzwqxVwOX9iOtXo9EECMwwl1BkszH06rPr51oba/e/Q9WkFN1DQXLS1vx
         UlyQLFxuuIUjKsIZVBxzI5k3UYRO6wiQnGDEQV9DR0/q8lMFTNlfCUdJAIUONlqxsUG5
         7AMPGJTchfmAPlF1WY+eSfBmvL0/aH7BaGAzsFU+0Hr/cxqtXASqXwXLuPWjCpQFKMvY
         r+4M3DFemJvogGFu4QiM3dgEGAuZ0MdQn+gFZMnQveFH+p6eYoEwMi3pf31vE5xteIPD
         IW6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVv1QJ48vQD8Y36bxojYfTYewlwUn8NNM3c0YMeqPjotqrGVGBEK+2fyIPsmi56BOhu2x3CMucJxIk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+YRg5E0zf3f2Q1ufyYT9EmOej5rXpzFVy6Cj9bYvNb3hx5n6v
	UcxedoxKrF6W6qOqj9hh4qq/xuXFOgmB4baYh5vqio8VLUauX5XTr2XF
X-Gm-Gg: ASbGnctCQr1WYi0QFCNFqa1cKuTCHY4UT4rKlWNS0ugHHpuLNT/LlHO5Sa/RVBWlNIx
	ZmkHpjjZVBPBt5lgO3AkogMsrh26jhXw23ffzzO5681LJ8eTZz0uDoSf8pXDACdAF/ZMG7ne5KC
	8UwFmu3LQdz54YTUwSEkBhQdC1pZdcc1uAZjjSRMTbzrnsQFp3YEsSCxdxVuRGJcMXSR4bcObiw
	62twSwAKHD9J3qNJ3mjyROYdi+SFG1F6cxucjcLiPDooo/fX8v4hPf+IeehUMiKlUKk4WtNKP+6
	OWHm8roSJ87adIz4KhY+04BUApbBxAdKxTYhIVTIoyBEd1o2tjpITRttr0PEyWBpEEgSvpGeEod
	NcCNUhufs3QYsnSLQKABcrrYeoU/bXKEZ0oH2qw==
X-Google-Smtp-Source: AGHT+IH2NBu6L+bASXNqg9sJUcZ42MFCB2aqzEFiqoDEW6um54A4CtHcJnO37auTgFbi6nwycKDm8A==
X-Received: by 2002:a17:907:a089:b0:b19:969a:86 with SMTP id a640c23a62f3a-b24f35aa177mr45885966b.37.1758225496090;
        Thu, 18 Sep 2025 12:58:16 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b1fd1101c44sm264530466b.82.2025.09.18.12.58.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Sep 2025 12:58:15 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: nschichan@freebox.fr
Cc: akpm@linux-foundation.org,
	andy.shevchenko@gmail.com,
	axboe@kernel.dk,
	brauner@kernel.org,
	cyphar@cyphar.com,
	devicetree@vger.kernel.org,
	ecurtin@redhat.com,
	email2tema@gmail.com,
	graf@amazon.com,
	gregkh@linuxfoundation.org,
	hca@linux.ibm.com,
	hch@lst.de,
	hsiangkao@linux.alibaba.com,
	initramfs@vger.kernel.org,
	jack@suse.cz,
	julian.stecklina@cyberus-technology.de,
	kees@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-block@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	mcgrof@kernel.org,
	mingo@redhat.com,
	monstr@monstr.eu,
	mzxreary@0pointer.de,
	patches@lists.linux.dev,
	rob@landley.net,
	safinaskar@gmail.com,
	sparclinux@vger.kernel.org,
	thomas.weissschuh@linutronix.de,
	thorsten.blum@linux.dev,
	torvalds@linux-foundation.org,
	tytso@mit.edu,
	viro@zeniv.linux.org.uk,
	x86@kernel.org
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
Date: Thu, 18 Sep 2025 22:58:06 +0300
Message-ID: <20250918195806.6337-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20250918152830.438554-1-nschichan@freebox.fr>
References: <20250918152830.438554-1-nschichan@freebox.fr>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> When booting with root=/dev/ram0 in the kernel commandline,
> handle_initrd() where the deprecation message resides is never called,
> which is rather unfortunate (init/do_mounts_initrd.c):

Yes, this is unfortunate.

I personally still think that initrd should be removed.

I suggest using workaround I described in cover letter.

Also, for unknown reasons I didn't get your letter in my inbox.
(Not even in spam folder.) I ocasionally found it on lore.kernel.org .

-- 
Askar Safin
