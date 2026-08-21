Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7C931B803
	for <loongarch@lists.linux.dev>; Fri, 21 Aug 2026 13:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320220; cv=none; b=ZUlS582qqohawASrD3Kuo3656V2ExlNhtKiZqF9Kc7OST+ZSms8T4h/PTO9AdEk6/XzfJagM6j73pDa7x6OQ4sqDMLvD+lHifuxYbIoTWp5xrrdOX2zWa4a/Fl6obH+TiSTbpdJXhWLW9v3pXrhG5ZRJmAmjyUTCKRwLo15JbXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320220; c=relaxed/simple;
	bh=RYqkv53J5NrkqBLuRcgdRfcpAvdgLLB7SotsZ958SG4=;
	h=From:Subject:Date:Message-Id:MIME-Version:To:Cc:Content-Type; b=t+zCnY6PwF9nnd3+9aWYx4aMBetg1h7ALhio05NZCFVI6Gi2ASuXtzw29cxJmiUtwsl3BIS/cUXIUiebwNpcnzondkC4E+q8RuRtG/O0o/d98O0yfdjtwecIUY3UHxKVo9ZO8F6isTtpkRr4gx9UwbXZEVUnduGIVdbo+S8+nqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xuu50gXO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xuu50gXO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787320217;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FxYBqvqfSfMLOK6E3WTT29SXyr6Pc7OT1nYn+VS1dSk=;
	b=Xuu50gXOOIn+pTbi08Q2z8+CBj+UQQAsKSQDDtra8kvFSItupBoqUd4pwMbFlwSoB6TPaB
	cg0i6v8z1NplqT5vzu4ZU1/l8yvAx8IYKCjw2FZW9woao5ythyq7ZwoXET9u7b06+cw4Pt
	pxfPzaa3IDgnvpLrGQei5CKaoFjB1mE=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-675--2I6bKc7Nu6mOma6HGRxDQ-1; Fri, 21 Aug 2026 09:50:15 -0400
X-MC-Unique: -2I6bKc7Nu6mOma6HGRxDQ-1
X-Mimecast-MFC-AGG-ID: -2I6bKc7Nu6mOma6HGRxDQ_1787320214
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so1852466a91.2
        for <loongarch@lists.linux.dev>; Fri, 21 Aug 2026 06:50:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320214; x=1787925014;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FxYBqvqfSfMLOK6E3WTT29SXyr6Pc7OT1nYn+VS1dSk=;
        b=Rgxpa/4p+z+p21tJi7deu7/gDS+8s+JmqICxvShUiCaIOGcPhP5V2vNo54XMxn3R/y
         e+1R9AdjWQZ1RBZ1BSr8MGpJ6r0wxUwceElNaqnpQ7/ZFpIiRunWyHe+G6s1tvTuhJvU
         M2WVZjqzlGbgGLNG7URN0Tm894IQ/DivrHDvw0p+6h9QcOMP17mdyd6kPuW+HQ6qDfL8
         c/f1GvG+6BnhabWiJAJQIoqD5BXEU5F+DgzWGODw651OeWmp9gbYcRBd5uq1T1mNuBwN
         MCHNjF3PKBY3W7Si43yLeLlkHuZF3bybgpzKSrehyxrxPwaYvDb3MEByIY5t+QmmEP32
         ghCA==
X-Forwarded-Encrypted: i=1; AHgh+Rrz8AIz2bcOe9MHjC6KFGte8y52un17OJdCZy1P+t73DugraiPPmPAvJn/OjEWGTF4r9ViXKEnEIP4=@lists.linux.dev
X-Gm-Message-State: AFuF++nC1YfTgp0N4xYs9NOMkz18H+7rfF3/nyWNMWNSgPZrG6aa8y5N
	oeC+/QsX4+I2Vk/1yI4eiFsKQW/W0W0ZIpyYI8m0CPHk8HIshjDdK5lcoQmQFUCWEURRr33LJC9
	I+WeshjTcCAco/gdBIGHr4O1uldZui4SLcC7iLQMBiemosOisFZY+vTJRZo7iNw==
X-Gm-Gg: AR+sD11gFnqgNMIK3j+PHl8wWz1W10Rz9+288ijTtxM10b0NShFVpOpZWsYl/MvF+7h
	mpUFhYYfHYxuwGf0QeI6Z6By0I1OHDDvUQub74HvfmQZgBviTRyWzxLopd+7HIp/mIcza52qRNG
	uIgLIn/s1wEXy9KArDc2jtNBb/xm/4Q1HdVjMkcJni6B7/tT39YBD1RYanFx41LIH+E1wU4wOyD
	K0ylTR7DiMvEKGYamQscS2XuIB/F1pgUJMDXkcYxVdhi5hDvgQtQ0iVkGyfoleUcqLLkOoc48vI
	H43tNIpuoGdlqfElNQqKLFmfSnzeAEwN/T+xu2sO+3UJLaqF/jqsotLkmVDyw2iocaanwWLnaW6
	yaFDMIeh70KMHtqZyGDh0BKNghYFsE6qU
X-Received: by 2002:a17:90b:3ecc:b0:38e:ad9d:1161 with SMTP id 98e67ed59e1d1-395c2f9fa9bmr10834157a91.0.1787320213438;
        Fri, 21 Aug 2026 06:50:13 -0700 (PDT)
X-Received: by 2002:a17:90b:3ecc:b0:38e:ad9d:1161 with SMTP id 98e67ed59e1d1-395c2f9fa9bmr10834046a91.0.1787320212881;
        Fri, 21 Aug 2026 06:50:12 -0700 (PDT)
Received: from mpilaniy-mac.redhat.corp ([122.171.22.116])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c4c194d2sm3300502a91.15.2026.08.21.06.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 06:50:12 -0700 (PDT)
From: Mukesh Pilaniya <mpilaniy@redhat.com>
Subject: [PATCH v3 0/2] kexec: fix probe error codes and error propagation
Date: Fri, 21 Aug 2026 19:19:56 +0530
Message-Id: <20260821-mpilaniy-v3-0-76b355399d2e@redhat.com>
Precedence: bulk
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw6CMBQFf4V0bU0fYq0r/8O4gPZWrpFCWmwkh
 H+X4gYTl5OcmTORCAEhknMxkQAJI3Z+AbkriGkqfweKdmEimDiyE5e07fFZeRypczUzRgsjuST
 LvA/g8L2mrrcvx1f9ADNkPy8ajEMXxvUr8bz7k02ccqqUsgfLQDKnLgFsUw1707Ukd5PYmnpjC
 sqoLkELDRYYlD/mPM8fdp454+0AAAA=
X-Change-ID: 20260813-mpilaniy-ffb0cc92c313
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Baoquan He <baoquan.he@linux.dev>, Mike Rapoport <rppt@kernel.org>, 
 Pasha Tatashin <pasha.tatashin@soleen.com>, 
 Pratyush Yadav <pratyush@kernel.org>, Tao Liu <ltao@redhat.com>, 
 Philipp Rudo <prudo@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org, 
 kexec@lists.infradead.org, Mukesh Pilaniya <mpilaniy@redhat.com>, 
 Bradley Morgan <include@grrlz.net>
X-Mailer: b4 0.15.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jjzNE8JUUaKV-cj9YdpXBSNeQb6eQ4G-DloWnYHTaxg_1787320214
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

While debugging a misleading error on s390x where kexec -s reported
"syscall kexec_file_load not available" instead of the actual EINVAL
from a kernel command line that exceeded the architecture limit, we
found that some kexec image probe functions return -EINVAL instead of
-ENOEXEC for format mismatches, and kexec_image_probe_default() has a
bug where it returns whatever the last loader returned rather than
always returning -ENOEXEC when no loader matches.

Patch 1 fixes all probe functions to return -ENOEXEC when they do not
recognize the image format.

Patch 2 fixes kexec_image_probe_default() to distinguish format
mismatches (-ENOEXEC) from real errors (e.g. -ENOMEM), propagating
real errors immediately and only continuing to the next loader on
-ENOEXEC.

kexec-tools patch:
https://lore.kernel.org/all/20260814075329.30203-1-mpilaniy@redhat.com/

Signed-off-by: Mukesh Pilaniya <mpilaniy@redhat.com>
---
Changes in v3:
- Patch 2: rename ret to err and change ret == 0 to !err as suggested by Mike.
- Link to v2: https://patch.msgid.link/20260819-mpilaniy-v2-0-95e929ede0e5@redhat.com

Changes in v2:
- Added patch 2 to fix error propagation in kexec_image_probe_default(),
  as suggested by Pratyush Yadav.
- Link to v1: https://patch.msgid.link/20260813-mpilaniy-v1-1-777d4d0e30f7@redhat.com

To: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
To: Huacai Chen <chenhuacai@kernel.org>
To: WANG Xuerui <kernel@xen0n.name>
To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
To: Andrew Morton <akpm@linux-foundation.org>
To: Baoquan He <baoquan.he@linux.dev>
To: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
To: Pratyush Yadav <pratyush@kernel.org>
To: Philipp Rudo <prudo@redhat.com>
To: Tao Liu <ltao@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: loongarch@lists.linux.dev
Cc: linux-riscv@lists.infradead.org
Cc: kexec@lists.infradead.org

---
Mukesh Pilaniya (2):
      kexec: return -ENOEXEC from image probe functions on mismatch
      kexec: fix error propagation in kexec_image_probe_default()

 arch/arm64/kernel/kexec_image.c   |  4 ++--
 arch/loongarch/kernel/kexec_efi.c |  4 ++--
 arch/riscv/kernel/kexec_image.c   |  4 ++--
 kernel/kexec_elf.c                |  4 ++--
 kernel/kexec_file.c               | 12 +++++++-----
 5 files changed, 15 insertions(+), 13 deletions(-)
---
base-commit: dd8c49a14f169d58e7a07a2c96fb588f3456efa0
change-id: 20260813-mpilaniy-ffb0cc92c313

Best regards,
--  
Mukesh Pilaniya <mpilaniy@redhat.com>

