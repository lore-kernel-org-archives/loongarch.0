Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5925F13774D
	for <loongarch@lists.linux.dev>; Sat, 13 Sep 2025 00:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757724531; cv=none; b=iNAKpnaUmFlu3fRQf7VwDpj0hWEPjEyuEA9Fa7Ya6KMu6tIKUmQKtcqQgDnyGyIYIGmGDKGzqpCY6SI84sE2oA9SpFrtIm9M7UwFRLEdSDSAPxEgaW8XuynHYw59m3ZysD55KpHQ5xcTJfazwedXmE1u0tux9UMkh6wAp5pbMfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757724531; c=relaxed/simple;
	bh=xKqULWXz/2FiENcJWmfzamYmMIE4imk3W/BtNdWBiQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YGlugMvamI3Jv/uyBmL9HGBvddcQWPjdnBzkJ5Ojer+SIRyYEscQKUYbiHqiCBVU6rGEJ7yYYeuhSxIFHH+t7ESNCtUwTTJbuhr+1+8txsgMIwFIhoSFiOauGgJUFZqoSDX55/Ua6wlobakYWhGWDV0HKmouQJvfr/kkVpxzi7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BBo3otUe; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBo3otUe"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b07c38680b3so226188166b.1
        for <loongarch@lists.linux.dev>; Fri, 12 Sep 2025 17:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757724526; x=1758329326; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AaXPZ8GS+1OiGE0ZCje70+VbQ3y123W+k6t1ILETLlQ=;
        b=BBo3otUekAync7q23RMKpZgms6gdWqlZ/7PrBLv0bjl5b5F1jVPDmRgXG457qDiVdZ
         cBFdoqU087NNMZnmgeJ5sFdJ4NXUGnSs6C+eQMDTrwD1indudTzbF2gNBlu8MnioZJKx
         72Iec74qlHH9gTh9Y6KJ6LfAjAanB/zj+87GE20GY6ydel/H685rv+tVaUxhTlOn98Kk
         vXLd9Dgqen0QWeeKntNzVqTs0c+AgL7uDr++K44qo6TKoKn9GDoB4xAwX6qQ3g/tDJII
         XhaQtJ3ypWs5KJfGEL0hFZssIG7xxxkKfWeAH2tlyBlor31mMeSNDlMiC/n+dMWvTZmx
         6UAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757724526; x=1758329326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AaXPZ8GS+1OiGE0ZCje70+VbQ3y123W+k6t1ILETLlQ=;
        b=PHbS2xswRREIsQ9a4tLzsVfDBJDO0Rv9q+kaMS510vC0dDH8qWcIpmALhHIR8ivK57
         QScOT7VBWbHixfdaBef9CzXI/f3S5i0jeRo+1lkAyF7m/0Rtrrp1+5h9Mm2LeKhy1FI7
         LBZ5l7mtngMf7ZE796O/PAMmkLTndrUKezfwHjOJT/vIl7jLvvm4PFeIcqsM5qYM5eLd
         XWRRBO9GzjD2LYYlF1vhhVDNVMgyDJUHkcvWJJyp9Z1mpTbVWBejmoAGJfMCr8MvNgqs
         +oe3NxJWiC5V2I1fOX99U+GnNarfxxMaqNuasgWebVQh7rxAGNqpRv8jyMsCIVyycbGC
         r8kg==
X-Forwarded-Encrypted: i=1; AJvYcCVUOEZVg8nt4z+B+Jq7XcBNy+zpqxUrcVrb/Yw4yXDjQxC1dmNGzsdaTlXlTRS5c2QNwHZjyj/BMAw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxJ6xKJ45GCdiVE3PqvY2BVG/eQnh5jsh7M5Af3SonmkAD/j0fS
	pPykU2FaMQbdZneY9u54g5pFYJSMZWRz8HFgrUBu3DmNB0NhF8lr6dVa
X-Gm-Gg: ASbGncuMeURkZS3sj7/dfKjedre6DaA9js9St13NTWX9YO7uE9pFZDhRV3884jF0Dbs
	rP6RsnUg4zafvGgJoH+Ber5f10XEEGCIdYeKuQQqxosLpPXl5Ke7pct2PJJITp+N+mg12tKY4OO
	NBxXre4KlgxZ/GPNJg22eABw1HABfkWycJaiGcc7phWku6j2CnNMmMzUqPG7OT00SKPJYu2GOo2
	VnEa1cBQpPZQvlLsk//aQbfqzuvsP7QPwHVjw5YTV0HkQU7cn21D9lcMqVJC1cuMEDKhhN1L3/g
	t4DaQbKQrXvwn8YCLLnJ3S//rvKr50PF75HN5IorMgTASScSCAowHY3Pu2fS0xlpxFZJQNRE7Ni
	8ZdqMXv0/IuVjUO4QggI=
X-Google-Smtp-Source: AGHT+IG9OWg6vz1Y30fO80tUWulNMPWiUpAt7xVByuYcp52he6rblxs++6dTXTQkGfdvR2czpiOABA==
X-Received: by 2002:a17:907:d88:b0:af9:add3:6bbb with SMTP id a640c23a62f3a-b07c35fb469mr433586666b.29.1757724525627;
        Fri, 12 Sep 2025 17:48:45 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b07b32dd5bfsm461777466b.63.2025.09.12.17.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 17:48:45 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Julian Stecklina <julian.stecklina@cyberus-technology.de>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Art Nikpal <email2tema@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Curtin <ecurtin@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	Rob Landley <rob@landley.net>,
	Lennart Poettering <mzxreary@0pointer.de>,
	linux-arch@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	linux-block@vger.kernel.org,
	initramfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	linux-acpi@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>,
	devicetree@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Heiko Carstens <hca@linux.ibm.com>,
	patches@lists.linux.dev
Subject: [PATCH RESEND 08/62] arm: init: remove FLAG_RDLOAD and FLAG_RDPROMPT
Date: Sat, 13 Sep 2025 00:37:47 +0000
Message-ID: <20250913003842.41944-9-safinaskar@gmail.com>
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

They are unused since previous commit

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 Documentation/arch/arm/setup.rst | 4 ++--
 arch/arm/kernel/atags_compat.c   | 2 --
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/Documentation/arch/arm/setup.rst b/Documentation/arch/arm/setup.rst
index 8e12ef3fb9a7..be77d4b2aac1 100644
--- a/Documentation/arch/arm/setup.rst
+++ b/Documentation/arch/arm/setup.rst
@@ -35,8 +35,8 @@ below:
     =====   ========================
     bit 0   1 = mount root read only
     bit 1   unused
-    bit 2   0 = load ramdisk
-    bit 3   0 = prompt for ramdisk
+    bit 2   unused
+    bit 3   unused
     =====   ========================
 
  rootdev
diff --git a/arch/arm/kernel/atags_compat.c b/arch/arm/kernel/atags_compat.c
index b9747061fa97..8d04edee3066 100644
--- a/arch/arm/kernel/atags_compat.c
+++ b/arch/arm/kernel/atags_compat.c
@@ -44,8 +44,6 @@ struct param_struct {
 	    unsigned long ramdisk_size;		/*  8 */
 	    unsigned long flags;		/* 12 */
 #define FLAG_READONLY	1
-#define FLAG_RDLOAD	4
-#define FLAG_RDPROMPT	8
 	    unsigned long rootdev;		/* 16 */
 	    unsigned long video_num_cols;	/* 20 */
 	    unsigned long video_num_rows;	/* 24 */
-- 
2.47.2

