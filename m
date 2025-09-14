Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3C0266B56
	for <loongarch@lists.linux.dev>; Sun, 14 Sep 2025 03:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757822016; cv=none; b=EEbDvLYR61oGWfweZw2xLUIvH4Wh5fFGjlZZVtBp/4pgcPiumw5qdMsEHrAUL6nbYJ4ArXuNUYHfUZeADFdm8pd5tGMFrPwfO2yFgmFYemeF6XiBR5zGSbeUcDQ9gxxEOFh2WTJDKBlR7O+upgV1I7R1KMB8ofYePXkqXdJRB/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757822016; c=relaxed/simple;
	bh=FZoweijhihxtu6HrPrxAC18gjv4DF8N0f7D122SferU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Thnbn/GuYzIgRWCtH/Sh2HD9UJqUfiL7pqsp5X+RbES14YYtuV3uljSu318rTAS5JzFZLd2OHQh6v1WAmF18PM9ZRqYeqmIvvNlNMGCLEmfbo9GPAUj8pL8itb+QAkhq57SPfhsaYPDUW088+e6e7fB2YTewZ7TneLg4hPnkAck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3oTpmna; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3oTpmna"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-62ef469bb2cso2847387a12.2
        for <loongarch@lists.linux.dev>; Sat, 13 Sep 2025 20:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757822013; x=1758426813; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PB2E9PPBAv72v29AyxICCzYyZlb0WEV+ovfXoPOatKs=;
        b=U3oTpmnasehLq6F7cMy/uowT9mlOyNSqtg4gJmMaW4YjO5njphoeKZgUcxe67OrTZF
         YxlyQEdK6wL2bkUaI0s/NI49B3r6Q6wAM4gEVhe4uu4IJY3EymPUfUOVtYMLwOQZdw0K
         rniIhYIiFkWlIG8QheYvIHoRqhpulQkHWPcCgtpa5ilD/mMcJQ1gk8RKsff63WTgLtlt
         KLXgqlBrJ72T8BwI2+ZPVqjEFCzJ3unEPDc6sMxqdAx/StNgBuhTooA6dk1yQCRsYcLv
         idXC9cunFC5cK8ui5clkaYjrsx0PTohisuLG6+V3i2ZWtHq/JHRCV9u+kg+NmpWBMFtc
         gjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757822013; x=1758426813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PB2E9PPBAv72v29AyxICCzYyZlb0WEV+ovfXoPOatKs=;
        b=ifKvziMyfVFKBA4nrQkADJEaUzHByJeY+dzMHD0KNebmb/clVsTyNObWlhY5csFKfJ
         kxmwAZq0GCd6lp23b8RA+Oi6Gyjm8grsSdx+8pQd3lE4Bj186QtOQy/PzrGi517+Pbvy
         L2B/5QAdHKgaV1Y0tdrDrAXDkzIHtMIodLtxKiiPGpWofqCWbC/OyFi1U8hGs0dHLZ8J
         qvfp8oyucfo+o2O9jJElNRE0bv4KdwHY9u0NdkKPNLjjQti0YlLHRiyeOMcMlyoOWBBq
         EqZcNTRVuL2aHUWHE3Gc5pwoFc1FazSt1RrCDyJf1SbmxeYEzKYSxhzdBf4rN9pAfrdv
         n3Bg==
X-Forwarded-Encrypted: i=1; AJvYcCVVp0x4p3NP0EsKXEtnkVbQo0LhbL1QXzVQETd+RFnUpEgNzahZcKn3gUHgitbZS14bQd9hGFOec94=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw06Pxzdg0E33zhEG3jM8Bc1DIKACIxqXd5tPSC0LYxSUaV727h
	jTmOhGDQYOU1JolMHUXc99jBXl+Z+VKzPxNvIb0ssfXZCZ2sY2AmHadW
X-Gm-Gg: ASbGncvoH+I8ssb1mkOXXczggx++2yErprRJKuWlaVRRPlLv5xuR3LG7F/AdLnA0P84
	QzGmgd/YQOD3gv3XOYwJMNceIgSLSoNrWn5EBy2TnOsfry/2lAQGIL0ZAgAgXo8jFaJwJ43AHv5
	CkNUSuuIeJSadmbuRmPbzSH/yMSCciJfEvsdkVw8IR7xQxFoVwwrvRWlsGJYXEL+1VBfI70cVlk
	YcIiaHlGDEtyS/XZ3I2le5UkKOVNiEDFVelwEEpMKfMSHTK1TlI3xF1n7gOt95y5HgkRe+S76xx
	Nd4DAONjdyYExwVd8qiMnwy+jn342tIC74Vfhx+WA8J/GtDuCCDey+rXGh7UKnQEErhZG2p7fWN
	TPJEv5wFx1u6ZfBs2il45cTBbbikKrg==
X-Google-Smtp-Source: AGHT+IGUQXhZVcMzH5x4qrxgNQpCZ4sYyZ3ugDsvfNumu2I8pECs9df4oC+H+CMnm997jPnr5crTug==
X-Received: by 2002:a05:6402:2111:b0:61d:2096:1e92 with SMTP id 4fb4d7f45d1cf-62ed82614c4mr7020136a12.15.1757822012514;
        Sat, 13 Sep 2025 20:53:32 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62ec33f3a5esm6570485a12.30.2025.09.13.20.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Sep 2025 20:53:32 -0700 (PDT)
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
Subject: [PATCH RESEND 43/62] setsid: inline ksys_setsid into the only caller
Date: Sun, 14 Sep 2025 06:53:26 +0300
Message-ID: <20250914035326.3661003-1-safinaskar@gmail.com>
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

This is cleanup after initrd removal

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 include/linux/syscalls.h | 1 -
 kernel/sys.c             | 7 +------
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index 77f45e5d4413..75e9ee03d19b 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -1231,7 +1231,6 @@ int ksys_fchown(unsigned int fd, uid_t user, gid_t group);
 ssize_t ksys_read(unsigned int fd, char __user *buf, size_t count);
 void ksys_sync(void);
 int ksys_unshare(unsigned long unshare_flags);
-int ksys_setsid(void);
 int ksys_sync_file_range(int fd, loff_t offset, loff_t nbytes,
 			 unsigned int flags);
 ssize_t ksys_pread64(unsigned int fd, char __user *buf, size_t count,
diff --git a/kernel/sys.c b/kernel/sys.c
index 1e28b40053ce..66e1e2dfd585 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -1265,7 +1265,7 @@ static void set_special_pids(struct pid **pids, struct pid *pid)
 		change_pid(pids, curr, PIDTYPE_PGID, pid);
 }
 
-int ksys_setsid(void)
+SYSCALL_DEFINE0(setsid)
 {
 	struct task_struct *group_leader = current->group_leader;
 	struct pid *sid = task_pid(group_leader);
@@ -1300,11 +1300,6 @@ int ksys_setsid(void)
 	return err;
 }
 
-SYSCALL_DEFINE0(setsid)
-{
-	return ksys_setsid();
-}
-
 DECLARE_RWSEM(uts_sem);
 
 #ifdef COMPAT_UTS_MACHINE
-- 
2.47.2

