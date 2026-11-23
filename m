Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.194.254.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795436267;
	b=lKEtLeul0pU5sIzdvn28h4HnraMcvbrkTzOWl7a6MPn/P07V3fE5rTNo0vQ8Lnr880xN
	 UaisCjxg1b5gyS9k6KpyPNP5LxzXh78JfyI+pHO+mdWnQd/P6qNObQ5qsRd+8TsWKjNCk
	 OqYXijZswZgVDPl+YlCbQJQdEVlNto4Q4+abjjuBTJtiJlWyaHVMSKG4g0lUMs/+LE+aA
	 hqREX3Fo7pjCi6TzamYZ8wj8C6IA4Ubqc7mzzRmmgt1+lgdB3kEwqIXmSjFVKXqn4IH9R
	 gPnOtrLKC+o5zwmEzbmDJIMp+EPEzhOAEc1OH5CJ7N5XjVosbnNkWDDIXkHMTITJr5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795436267;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:EX-QQ-RecipientCnt:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=w/P7Au62M+92CbRcPyECeOn9VVSwxvVTLIBVsrRkV4U=;
	b=EP4aGMfQbZk6ULDRq4K+ypI2pkwRjtEymEhDbZknGsH0dQCjJlPctJ6kyjDWJSYk391E
	 OOkaVB/vWM/njU9GUf2KI/wGndhZYasXKa4/kQ//8t4Sj6F2de1MDYylvsQGCZ5EE6hE6
	 wI1wpMJ3oQ+DyqOltkNcGJTo8Q3eJRvGRkBNP257JEgjkt6c4HAij9Y4xlSoMb2v6Q/bp
	 +R1OhyEV1OrdEqk0HZ/SdW5SRlWzOQ01FQCIFcZdufMop/D054jzheg8+2lSY+KFUsUIN
	 Qx95Ps+UZnC8HKV6Ktm9n3GsVn1erXhmWkzocLe4/xGiUi63/nsNCeJrt8dlY4XWtrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uniontech.com;
	spf=pass smtp.mailfrom=uniontech.com;
	dkim=pass header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=c6jWfE6f;
	arc=none smtp.remote-ip=18.194.254.142
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BA8606A33E
	for <loongarch@lists.linux.dev>; Mon, 23 Nov 2026 12:17:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97BA8606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=uniontech.com header.i=@uniontech.com header.a=rsa-sha256 header.s=onoh2408 header.b=c6jWfE6f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1795436242;
	bh=w/P7Au62M+92CbRcPyECeOn9VVSwxvVTLIBVsrRkV4U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=c6jWfE6fs8QMnPMkZdSuqQ7WLE8ee3OyQgsxn+XuawzwQ2iKTWsIu286sWIGu2pS0
	 /3HtLr7A8g7GaYv4qyxf9DfwjVGlajN469GNMlABA5fwgbd7tlo994dnDMuyAZXN1E
	 GzZ+SRf7V51Ditvnp+2AeeedcoXHhxk7xvIjxOhE=
X-QQ-mid: zesmtpsz8t1795436226t187c8887
X-QQ-Originating-IP: m11/7KgAf6dNCDHmt9WGjVhdPFueqtJpyyEwn2eQiWw=
Received: from localhost.localdomain ( [61.183.83.60])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 23 Nov 2026 20:16:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2967070718750964981
EX-QQ-RecipientCnt: 5
From: Wentao Guan <guanwentao@uniontech.com>
To: chenhuacai@kernel.org,
	nathan@kernel.org
Cc: linux-kbuild@vger.kernel.org,
	loongarch@lists.linux.dev,
	Wentao Guan <guanwentao@uniontech.com>
Subject: [PATCH RFC] kbuild: deb-pkg: strip orphaned debug labels from LoongArch modules
Date: Mon, 23 Nov 2026 20:15:55 +0800
Message-ID: <E73BE2D8A39F2EBF+20261123121554.2559667-2-guanwentao@uniontech.com>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: loongarch@lists.linux.dev
List-Id: <loongarch.lists.linux.dev>
List-Post: <mailto:loongarch@lists.linux.dev>
List-Help: <mailto:loongarch+help@lists.linux.dev>
List-Subscribe: <mailto:loongarch+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:loongarch+unsubscribe@lists.linux.dev>
List-Owner: <mailto:loongarch+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: OOH5Lt9wNw30p5dDjYlENwairEk+43N76HHMpgtxTuRflNnbgKT/76aj
	X6h8a8rDAW59OdaqHUPphFT9CDEywlTsu7S2LSB6R7Tbzo9vE3WxS0lofDnjjnJ7Kqkxdwi
	qxAtaUtRjbH5VHv0rw918Fxw7vXp4GOmH3KDc3HpXe7uchhL6leYuaZgxTw9VAv7T3etSaw
	Fl2vZoYdAgHXe74a0egwynxa4blMAIOA5qS9yjg6amKOdpWqog0IyaKIwHEzyM2HKmre/f2
	3vFj33O4rtaqHlMnymzVjDhc0ebNKOAUnXX2BDpbdwUx2hob83QZ+G7C7HOCC0D6AfA8cbE
	LWTZSj/f5CFpEa8jbsT7CHpk34/squ8Ez6LTak7w6xDgWL8LH9LPdN+PC0i+Ln8jA6/mBqU
	d3iwqxlPzDzhJYdkwePVQ8iwuWPhjc37MEagJMACnsaF65qhgd+7OrBtg7k1BI0O3BOrGNl
	VWIYUOrtTHgHFB76SJYpc6IOngSKawWme8+eurh5KKMvXULHmjvOPxIYpOoU0VV0gGqgRIU
	rEQbYWCBVmTbG5dg25mI7INKuDxU2Cq35y7x7nzay61O4mVszr8G7ddWAM6XuRAAWGs84j9
	mUV+HaTIqldjjUXBTFwUxA8wFjJ+z3Usrc9B7vc4DZeQLkR+fRrLstL/GJmb26h5WN4JI8L
	iAZY30YW+IM8jd4AU5jMw2e6TUVm1tMguKvMTAU/oK/XDPZyzonXL6oA9Qli3UB+8iyo2nG
	1iUTkjDrWvVZy2EqoWj5RCnS8Pk620CyK5vobwMvzY3kg2vlf8yshY50BWWU4s7stpAWyve
	ocPX4eUn+Z9R/x/R+uRWsLy3rbUYyXdSriExCBQdFuvo3Rr3Ub3CAuMGNXdlj0gSuCYPoI4
	6mwK2LSjwmg0tmDW4N2rlzpFs23MuekhXRNEnAFZjmh86f11+11waOnF+kbB4J4hCdki2QJ
	JGR+WSCGxzajU0MTCN4og0tCA8o7Tc2cU8qnl9XA7mPUxShVQaaqGrkjGY+97MGpTCFdXsx
	bZCDLxJY+gJO4S3Xiuuj0MZ9ZYA4WkXgu9DI4SgES6qe3aIiHgA37TjVuWgrM=
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

With CONFIG_DEBUG_INFO, gcc emits .L-prefixed labels for function and
block boundaries and for location views (.LVL, .LBI, .LBB, .LFB, .LPFE),
and the assembler keeps them in .symtab as long as a debug section
references them.  On x86-64 those references are expressed as a section
symbol plus an addend and the labels are discarded, but the LoongArch
assembler has to name them in relocations:

    0000000000000057 R_LARCH_64          .LFB1 + 0
    0000000000000015 R_LARCH_ADD_ULEB128 .LVL0 + 0

so they end up in the object's symbol table.

INSTALL_MOD_STRIP=1 expands to "strip --strip-debug", which is a section
operation: it drops .debug_* and .rela.debug_* but leaves the symbol
table alone, so every label that was only referenced from debug data
stays behind as an orphan.  On 7.2.2-loong64-desktop-rolling 86.7% of the
roughly 3M module symbols are such labels.  Nothing uses them at run time,
yet they cost 22% of the module payload (168 MB -> 130 MB) and 19% of the
linux-image package (195 MB -> 157 MB).  This is the same problem
commit ac031f26e89cc ("kbuild: add option for stripping modules while
installing them") addressed for the general debug-info case.

Strip them with --discard-locals as well.  binutils removes a local
symbol only when its name still follows the assembler's local label
convention (.L, .., _.L_ and the L<digits> pseudo labels) *and* no
relocation in the output still names it: mark_symbols_used_in_relocations()
sets BSF_KEEP on every relocation target and filter_symbols() keeps those
unconditionally.  What the module loader needs therefore survives -- the
relocation set of every module is byte-for-byte identical before and
after, .LC, .LPFE and the -fpatchable-function-entry labels stay, exactly
one SHT_SYMTAB remains as elf_validity_cache_index_sym() requires, and
the modules are still signed, because modules_install strips before it
signs.  The dbg package is built from the unstripped modules in the build
tree, so it keeps all debug information.

Restrict this to LoongArch on a GNU toolchain, everyone else keeps
INSTALL_MOD_STRIP=1.  Other architectures never see these labels: on
x86-64 the option drops two unreferenced .LC symbols out of an amdgpu.ko
and leaves all 429,648 relocations alone, so there is nothing to gain
there.  LLVM builds have to keep the plain option, because
kbuild hands the same value to llvm-strip for LLVM=1 and llvm-strip
refuses to strip a symbol that a relocation still names, aborting the
build, while clang does emit such labels for string constants:

    llvm-strip: error: 'super.ko': not stripping symbol '.L.str.1'
    because it is named in a relocation

Clang none the less generates none of the debug labels that make the
package grow, so an LLVM build loses nothing by being left alone.

Boot tested with qemu-system-loongarch64 (EDK2 firmware, vmlinuz.efi,
test modules loaded from the initramfs with finit_module()): modules
stripped with --strip-debug, --discard-locals and --strip-unneeded all
load with rc=0, while --strip-all is rejected with "module has no symbols
(stripped?)".

Signed-off-by: Wentao Guan <guanwentao@uniontech.com>
---
 scripts/package/builddeb | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index a806f5094da44..a355d65927115 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -35,7 +35,14 @@ install_linux_image () {
 		${MAKE} -f ${srctree}/Makefile INSTALL_DTBS_PATH="${pdir}/usr/lib/linux-image-${KERNELRELEASE}" dtbs_install
 	fi
 
-	${MAKE} -f ${srctree}/Makefile INSTALL_MOD_PATH="${pdir}" INSTALL_MOD_STRIP=1 modules_install
+	mod_strip="1"
+	if [ "${SRCARCH}" = loongarch ] &&
+		"${STRIP:-strip}" --version 2>/dev/null | grep -qs "^GNU strip"; then
+		mod_strip="--strip-debug --discard-locals"
+	fi
+
+	${MAKE} -f ${srctree}/Makefile INSTALL_MOD_PATH="${pdir}" \
+		INSTALL_MOD_STRIP="${mod_strip}" modules_install
 	rm -f "${pdir}/lib/modules/${KERNELRELEASE}/build"
 
 	# Install the kernel
-- 
2.47.3

