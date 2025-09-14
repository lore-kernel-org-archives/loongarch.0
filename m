Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3CD2727F9
	for <loongarch@lists.linux.dev>; Sun, 14 Sep 2025 04:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757823573; cv=none; b=PSuV0L7LAt5LiEw/FPuIBQL7DlUI9XyT2tzX45axIzQ3c+LXAg90LQLnyPk3lzo272y82OiH9OQs2t2MDREh96NBdPbGkWKl5c73fbhk4GH/AXXgYhLd3bYiXb6bw2zHnrO72rx9kjKil++8OlTWYHBzbWa1iVnSSANWM11wDDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757823573; c=relaxed/simple;
	bh=nKH8BykbZ/NG2ohjRy0QYNVXxhFKK6pBLbFy0ufJ1Dk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iVU/qzcmQTVe1hVRHlmMShjxhYtTrXDMyU8jizAqrFZp+D5wB30pKjsi6Y7/vPq7qEONsfc+OOKZ5FQgqrHWMEWEcPry3NaMMrN2nN1TMvBJymD7njxVmYkmT2BaUQW9/iml9KD9y21fgYTm6v7JBeNS81jAP+URIQeCxGfvSgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XH9MNpQd; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XH9MNpQd"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b0b6bf0097aso101166066b.1
        for <loongarch@lists.linux.dev>; Sat, 13 Sep 2025 21:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757823569; x=1758428369; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXtvCmrZRR9OgP0sG11mqG9m/nOQIjqm8VdJ9uLACjc=;
        b=XH9MNpQdxM3IOqbiHfJwhN8TGWQW4cxHi1rTA6uWA40Pc660O/mbkTtBVhK96uCgZo
         W/lYBm78nmRHbPlHwOxKUm3WLfZxsYsLPyquBfPTPaorUqXgQPzESkmc7wJ08pJi/C4e
         STP/kqCCXRMG9Cdt2j/jSOTBZMmz2O13rYg9fJige4HbmEx8uHim91bIiVVn4mzIOjzG
         eRLbbm/5wZyQFbX0NsuaLgIp36wbMcORVMQrqCIzAZ/KnVJLB/uP0kGbig0rjBdFD5w0
         HV8rDdB96N1AIvMFjEbXeGTutFkUwr+yDVICL+zunu3qv+GupCZcCowCHNKye01+pujk
         Kzyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757823569; x=1758428369;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXtvCmrZRR9OgP0sG11mqG9m/nOQIjqm8VdJ9uLACjc=;
        b=hUFp4amJq9zcjLjihikM9hryvMr8jarOgXAFueBtorAe0IQ8YIQFA57PNZ7QsT25tn
         LUxE0E0uHPX+Rtp5LEx5Q80KscEKGhV+Ffu3wZ3yTuSE0MzhZYnh0nTl+pv5/0MWm80N
         6meFsdw28tSj3SNvbpQs7gpQHfE/A/Bizrr9DOu9An6PkwAnfT9Gu6QR4DY7MiBxCu43
         n5YwZDKcd1y32WLmyHw+D+AmMGzga98+x09O6DjGoMCexMW2M/TrxD3ImcDJxnzUg1ZM
         Hkv+d3UCC8Rhv+PDdrpe4ene/xhYXSqaY0D7e3bWwcWR5yOwh7xoXk0+8SKBR+ALAMXt
         /t5g==
X-Forwarded-Encrypted: i=1; AJvYcCXonRiUvcVK5jtHOTtAH2qFH1SodqaW/i7WjPf2VBe4TzT8xM28hsLE8NZCYwuqfjAWAZmz/PwUlwA=@lists.linux.dev
X-Gm-Message-State: AOJu0YybV+hH2LrCi/a4orbHs17lsMbtry+w35ixO4Y7cCGDAZ2NA8LB
	kAL87UaQzP8CAU4MXu0ocKwiLTzZNXoHztRQVL+ke0xPIvMmbLQpVh8f
X-Gm-Gg: ASbGnctrtzdLWsPUMzm8gWtiANoRa/bEpQaBSeM58AU2x7EIFPODW3g8tcZwA8cpbsC
	g/msklZDCV6nTqa0Ca/CjQMLGBMVjwm4I1j6lAkY2z3iyi5cBJnVX6XH6tqlQcWhPVDTCzAh9ED
	W5MdnGdZn2S5MIxPdkhaqJnGh8kalDZlEEiMa4MS+teqDW9XKiqAOQL5chncH8QMSpdNfgMz+zM
	1wiOVIjDJA5TGY18oqIHuDIELKpuqKiJGFVndnKyma16J55d3nX6AJqitlwJYLjQIPa8VpbnSiK
	2CYJcvPW3lOU8Fja4Sn/E34cRhKGCCn0qZupzBdH0rtdhImo58LOYFTztTj7eC1P33VfgYfA7Ju
	JRxigosVBYQgHb4acZu5QbJ6ZeMwtSA==
X-Google-Smtp-Source: AGHT+IF6mujdx9qWAhF6oXDc9ZfcQYBKEdRbKR8jum+cm7upWvg9UYWarRjAWufJtq6SFHzRS8+jpA==
X-Received: by 2002:a17:907:9809:b0:b04:25e6:2ddc with SMTP id a640c23a62f3a-b07c353a723mr763099266b.8.1757823568595;
        Sat, 13 Sep 2025 21:19:28 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07c28f190fsm504796666b.39.2025.09.13.21.19.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 21:19:28 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: safinaskar@gmail.com
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
	sparclinux@vger.kernel.org,
	thomas.weissschuh@linutronix.de,
	thorsten.blum@linux.dev,
	torvalds@linux-foundation.org,
	tytso@mit.edu,
	viro@zeniv.linux.org.uk,
	x86@kernel.org
Subject: Re: [PATCH RESEND 00/62] initrd: remove classic initrd support
Date: Sun, 14 Sep 2025 07:19:23 +0300
Message-ID: <20250914041923.4119219-1-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Gmail banned me after first bunch of letters.
Just now I sent remaining letters.
So now the patchset is ready for review

-- 
Askar Safin
